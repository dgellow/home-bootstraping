;;; install-ohmyzsh.el --- oh-my-zsh configuration.
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
(defvar dg-ohmyzsh-git-repo "https://github.com/dgellow/oh-my-zsh.git"
  "")

(defvar dg-ohmyzsh-dir (expand-file-name ".oh-my-zsh" dg-user-home-dir)
  "")

(defun dg-ohmyzsh-install ()
  "Install oh-my-zsh if it is not already."
  (if (file-exists-p dg-ohmyzsh-dir)
      (error (format "File %s already exists." dg-ohmyzsh-dir))
    (dg-git-clone dg-ohmyzsh-git-repo dg-ohmyzsh-dir)))

(dg-ohmyzsh-install)

(provide 'dg-install-ohmyzsh)
;;; install-ohmyzsh.el ends here