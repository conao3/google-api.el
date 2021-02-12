;;; google-api-client.el --- Client submodule of google-api  -*- lexical-binding: t; -*-

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

;; Client submodule of google-api.

;;; Code:

(require 'google-api-http)

(defclass google-api-client ()
  ((api-url       :allocation :class)
   (auth-url      :allocation :class)
   (token-url     :allocation :class)

   (client-id     :initarg :client-id)
   (client-secret :initarg :client-secret)
   (scope         :initarg :scope)

   (access-token)
   (refresh-token)
   (expires)
   (refresh-url))
  :abstract t)


(provide 'google-api-client)

;;; google-api-client.el ends here
