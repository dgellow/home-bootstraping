;;; install-rvm.el --- rvm installation.
;;
;; Copyright (c) 2014 Samuel El-Borai
;;
;; Author: Samuel El-Borai <samuel.elborai@gmail.com>
;; URL: https://github.com/dgellow/home-bootstrapping
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not port of GNU Emacs.

;;; Commentary:

;;; License:

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Code:
(defvar dg-rvm-install-command "\curl -sSL https://get.rvm.io | bash -s stable")

(defvar dg-rvm-dir (expand-file-name ".rvm" dg-user-home-dir))

(defun dg-overwrite-rvm (file)
  ""
  (when (file-exists-p file)
    (cond
     ((file-symlink-p file) (delete-file file))
     ((file-directory-p file) (delete-directory file t))
     (t (delete-file file)))))

(defun dg-not-overwrite-rvm (file)
  ""
  (when (file-exists-p file)
    (dg-message (format "File %s already exists." file))))

(defun dg-rvm-install ()
  "Install rvm."
  (cond
   ((eq dg-overwrite-p 'y)
    (dg-overwrite-rvm dg-rvm-dir))
   ((eq dg-overwrite-p 'n)
    (dg-not-overwrite-rvm dg-rvm-dir))
   ((eq dg-overwrite-p 'a)
    (when (file-exists-p dg-rvm-dir)
      (if (y-or-n-p (format "Overwrite %s? " dg-rvm-dir))
          (dg-overwrite-rvm dg-rvm-dir)
        (dg-not-overwrite-rvm dg-rvm-dir)))))

  (unless (file-exists-p dg-rvm-dir)
    (shell-command-to-string dg-rvm-install-command)))

(dg-rvm-install)

(provide 'dg-install-rvm)
;;; install-rvm.el ends here
