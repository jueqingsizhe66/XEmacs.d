;;; init-thing-edit.el --- Thing edit

;; Filename: init-thing-edit.el
;; Description: Thing edit
;; Author: Andy Stewart <andy@freedom>
;; Maintainer: Andy Stewart <andy@freedom>
;; Copyright (C) 2013, Andy Stewart, all rights reserved.
;; Created: 2013-12-28 07:46:40
;; Version: 0.1
;; Last-Updated: 2013-12-28 07:46:40
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-thing-edit.el
;; Keywords:
;; Compatibility: GNU Emacs 24.3.50.1
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Thing edit
;;

;;; Installation:
;;
;; Put init-thing-edit.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-thing-edit)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-thing-edit RET
;;

;;; Change log:
;;
;; 2013/12/28
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require

(add-to-list 'load-path (expand-file-name "~/.emacs.d/customizations/my_plugins/thing-edit/"))
(require 'fic-mode)
(require 'one-key)
(require 'thing-edit)

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Thing-Edit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-thing-edit-alist nil
  "The `one-key' menu alist for THING-EDIT.")

(setq one-key-menu-thing-edit-alist
      '(
        ;; Copy.
        (("w" . "Copy Word") . thing-copy-word)
        (("s" . "Copy Symbol") . thing-copy-symbol)
        (("m" . "Copy Email") . thing-copy-email)
        (("f" . "Copy Filename") . thing-copy-filename)
        (("u" . "Copy URL") . thing-copy-url)
        (("x" . "Copy Sexp") . thing-copy-sexp)
        (("g" . "Copy Page") . thing-copy-page)
        (("t" . "Copy Sentence") . thing-copy-sentence)
        (("o" . "Copy Whitespace") . thing-copy-whitespace)
        (("i" . "Copy List") . thing-copy-list)
        (("c" . "Copy Comment") . thing-copy-comment)
        (("h" . "Copy Function") . thing-copy-defun)
        (("p" . "Copy Parentheses") . thing-copy-parentheses)
        (("l" . "Copy Line") . thing-copy-line)
        (("a" . "Copy To Line Begin") . thing-copy-to-line-beginning)
        (("e" . "Copy To Line End") . thing-copy-to-line-end)
        ;; Cut.
        (("W" . "Cut Word") . thing-cut-word)
        (("S" . "Cut Symbol") . thing-cut-symbol)
        (("M" . "Cut Email") . thing-cut-email)
        (("F" . "Cut Filename") . thing-cut-filename)
        (("U" . "Cut URL") . thing-cut-url)
        (("X" . "Cut Sexp") . thing-cut-sexp)
        (("G" . "Cut Page") . thing-cut-page)
        (("T" . "Cut Sentence") . thing-cut-sentence)
        (("O" . "Cut Whitespace") . thing-cut-whitespace)
        (("I" . "Cut List") . thing-cut-list)
        (("C" . "Cut Comment") . thing-cut-comment)
        (("H" . "Cut Function") . thing-cut-defun)
        (("P" . "Cut Parentheses") . thing-cut-parentheses)
        (("L" . "Cut Line") . thing-cut-line)
        (("A" . "Cut To Line Begin") . thing-cut-to-line-beginning)
        (("E" . "Cut To Line End") . thing-cut-to-line-end)
        
;; Replace
        (("r" . "Replace Word") . thing-replace-word)
        (("z" . "Replace Symbol") . thing-replace-symbol)
        (("e" . "Replace email") . thing-replace-email)
        (("n" . "Replace filename") . thing-replace-filename)
        (("q" . "Replace url") . thing-replace-url)
        (("Z" . "Replace sexp") . thing-replace-sexp)
        (("b" . "Replace page") . thing-replace-page)
        (("d" . "Replace sentence") . thing-replace-sentence)
        (("B" . "Replace Word") . thing-replace-block)
        (("y" . "Replace whitespace") . thing-replace-whitespace)
        (("Y" . "Replace List") . thing-replace-list)
        (("j" . "Replace comment") . thing-replace-comment)
        (("k" . "Replace defun") . thing-replace-defun)
        (("v" . "Replace parenthes") . thing-replace-parentheses)
        
))

(defun one-key-menu-thing-edit ()
  "The `one-key' menu for THING-EDIT."
  (interactive)
  (one-key-menu "THING-EDIT" one-key-menu-thing-edit-alist t))


(provide 'init-thing-edit)

;;; init-thing-edit.el ends here
