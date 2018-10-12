;;; python-pylint-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "python-pylint" "python-pylint.el" (23486 6806
;;;;;;  0 0))
;;; Generated autoloads from python-pylint.el

(autoload 'python-pylint "python-pylint" "\
Run PYLINT, and collect output in a buffer.
While pylint runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<python-pylint-mode-map>\\[compile-goto-error] in the grep output buffer, to go to the lines where pylint found matches.

\(fn)" t nil)

(defalias 'pylint 'python-pylint)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; python-pylint-autoloads.el ends here
