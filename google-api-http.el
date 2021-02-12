;;; google-api-http.el --- HTTP submodule of google-api  -*- lexical-binding: t; -*-

;; Copyright (C) 2021 Naoya Yamashita

;; Author: Naoya Yamashita <conao3@gmail.com>
;; Keywords: convenience

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; HTTP submodule of google-api.

;;; Code:

(require 'request)

(defclass google-api-request-response ()
  (;; original slots
   (url           :initarg :url)
   (code          :initarg :code) ; status-code
   (body          :initarg :body)        ; data
   (history       :initarg :history)
   (error-thrown  :initarg :error-thrown)
   (symbol-status :initarg :symbol-status)
   (done-p        :initarg :done-p)
   (settings      :initarg :settings)

   ;; original internal slots
   (buffer        :initarg :buffer)
   (raw-header    :initarg :raw-header)
   (timer         :initarg :timer)
   (backend       :initarg :backend)

   ;; enhanced slots
   (headers       :initarg :headers))
  "Enhance class on `request-response'.")

(defun google-api-http-make-query-string (params)
  "Build query string from PARAMS.

Example:
  (gcal-http-make-query-string '((\"a\" . \"b\") (\"c\" . \"d\")))
  ;;=> \"a=b&c=d\"

  (gcal-http-make-query-string '((a . \"b\") (c . \"d\")))
  ;;=> \"a=b&c=d\"

  (gcal-http-make-query-string '((a . \"b\") (c . (\"d\" \"e\"))))
  ;;=> \"a=b&c=d&c=e\""
  (cl-flet ((concat-args
             (elm)
             (format "%s=%s"
                     (url-hexify-string (format "%s" (car elm)))
                     (url-hexify-string (format "%s" (cdr elm)))))
            (concat-seqs (sequence) (mapconcat 'identity sequence "&")))
    (thread-last params
      (mapcan (lambda (elm)
                (if (atom (cdr elm))
                    (list elm)
                  (mapcar (lambda (e) (cons (car elm) e)) (cdr elm)))))
      (mapcar #'concat-args)
      (concat-seqs))))

(defun google-api-http-make-query-url (url params)
  "Build URL with query PARAMS."
  (concat
   url
   (when params
     (concat "?" (google-api-http-make-query-string params)))))

(provide 'google-api-http)

;;; google-api-http.el ends here
