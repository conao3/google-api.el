;;; google-api.el --- Google API utilities  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Naoya Yamashita

;; Author: Naoya Yamashita <conao3@gmail.com>
;; Version: 0.0.1
;; Keywords: convenience
;; Package-Requires: ((emacs "26.1") (oauth2-request "0.14") (async-await "1.1"))
;; URL: https://github.com/conao3/google-api.el

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

;; Google API utilities.


;;; Code:

(require 'eieio)

(defgroup google-api nil
  "Google API utilities."
  :group 'convenience
  :link '(url-link :tag "Github" "https://github.com/conao3/google-api.el"))

(defclass google-api-token ()
  ((api-url       :allocation :class)
   (auth-url      :allocation :class)
   (token-url     :allocation :class)

   (client-id     :initarg :client-id)
   (client-secret :initarg :client-secret)
   (scope         :initarg :scope)

   (token))
  "Google api token class."
  :abstract t)

(provide 'google-api)

;;; google-api.el ends here
