;;; google-api-interface.el --- Interface submodule of google-api  -*- lexical-binding: t; -*-

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

;; Interface submodule of google-api.

;;; Code:

(require 'google-api-client)


;;;; Calendar

(defclass google-api-calendar-client (google-api-client)
  ((api-url       :initform "https://www.googleapis.com/calendar/v3")
   (auth-url      :initform "https://accounts.google.com/o/oauth2/auth")
   (token-url     :initform "https://www.googleapis.com/oauth2/v3/token")

   (client-id     :initarg :client-id)
   (client-secret :initarg :client-secret)
   (scope         :initarg :scope :initform "https://www.googleapis.com/auth/calendar")

   (access-token)
   (refresh-token)
   (expires)
   (refresh-url)))

(provide 'google-api-interface)

;;; google-api-interface.el ends here
