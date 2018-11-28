;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; comment For awesome-pari                                                                   ;;
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t) ;;
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)                                  ;;
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)                       ;;
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)                                  ;;
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)                                  ;;
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)                                  ;;
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Comment for awesome-pair                                ;;
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)       ;;
;; (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode) ;;
;; (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; awesome pair

(require 'awesome-pair)

(dolist (hook (list
               'c-mode-common-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               ;; 'maxima-mode-hook
               ;; 'ielm-mode-hook
               'sh-mode-hook
               'makefile-gmake-mode-hook
               ;; 'php-mode-hook
               'python-mode-hook
               'js-mode-hook
               ;; 'go-mode-hook
               ;; 'qml-mode-hook
               ;; 'jade-mode-hook
               'css-mode-hook
               'ruby-mode-hook
               ;; 'coffee-mode-hook
               'rust-mode-hook
               ;; 'qmake-mode-hook
               ;; 'lua-mode-hook
               ;; 'swift-mode-hook
               'minibuffer-inactive-mode-hook
               ))
  (add-hook hook '(lambda () (awesome-pair-mode 1))))

(define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
(define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
(define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
(define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
(define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
(define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)
(define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)
(define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)
(define-key awesome-pair-mode-map (kbd "M-d") 'awesome-pair-backward-delete) 
(define-key awesome-pair-mode-map (kbd "C-k") 'awesome-pair-kill)
(define-key awesome-pair-mode-map (kbd "M-\"") 'awesome-pair-wrap-double-quote) 
(define-key awesome-pair-mode-map (kbd "M-[") 'awesome-pair-wrap-bracket)
(define-key awesome-pair-mode-map (kbd "M-{") 'awesome-pair-wrap-curly)
(define-key awesome-pair-mode-map (kbd "M-(") 'awesome-pair-wrap-round)
(define-key awesome-pair-mode-map (kbd "M-)") 'awesome-pair-unwrap)
(define-key awesome-pair-mode-map (kbd "M-p") 'awesome-pair-jump-right) 
(define-key awesome-pair-mode-map (kbd "M-n") 'awesome-pair-jump-left) 
(define-key awesome-pair-mode-map (kbd "M-:") 'awesome-pair-jump-out-pair-and-newline) 

;; M-o means ace-window



