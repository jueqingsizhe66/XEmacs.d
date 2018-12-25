;;; fixme-mode.el --- fixme minor mode to highlight warning words

;; Copyright (C) 2014 Nathaniel Flath <flat0103@gmail.com>

;; Author: Nathaniel Flath <flat0103@gmail.com>
;; URL: http://github.com/nflath/fixme-mode
;; Version: 1.0.2

;; This file is not part of GNU Emacs.

;;; Commentary:

;; fixme-mode will highlight warning words as font-lock-warning-face.  These
;; words are defined in fixme-mode-warning-words.  By default, these are:
;; FIXME TODO BUG KLUDGE FIX FixMe HACK REFACTOR NOCOMMIT

;;; Installation

;; To use this mode, put the following in your init.el:
;; (require 'fixme-mode)

;; This will be default turn fixme-mode on in all future prog-mode buffers.
;; To enable it in a specific buffer, run fixme-mode

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(defvar fixme-mode-warning-words '("FIXME" "TODO" "BUG" "KLUDGE" "FIX" "FixMe" "HACK" "REFACTOR" "NOCOMMIT")
  "List of words to highlight as warnings in fixme-mode")

(defun fixme-mode-add-keywords ()
  (font-lock-add-keywords nil  `((,(regexp-opt fixme-mode-warning-words 'words) 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil  `((,(regexp-opt (mapcar (lambda (x) (concat x ":")) fixme-mode-warning-words) 'words) 1 font-lock-warning-face t))))

(defun fixme-mode-remove-keywords ()
  (font-lock-remove-keywords nil  `((,(regexp-opt fixme-mode-warning-words 'words) 1 font-lock-warning-face t)))
  (font-lock-remove-keywords nil  `((,(regexp-opt (mapcar (lambda (x) (concat x ":")) fixme-mode-warning-words) 'words) 1 font-lock-warning-face t))))

;;;###autoload
(define-minor-mode fixme-mode
  "Flag FIXME and other strings as a warning"
  :init-value nil
  :group 'fixme-mode

  (if fixme-mode (fixme-mode-add-keywords)
    (fixme-mode-remove-keywords)))

(add-hook 'prog-mode-hook (lambda () (fixme-mode t)))
(provide 'fixme-mode)
;;; fixme-mode.el ends here
