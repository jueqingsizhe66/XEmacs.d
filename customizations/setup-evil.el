(set-face-attribute 'default t
                    :family "Consolas"
                    :height 130
                    :weight 'normal
                    :width 'normal)

(setq line-spacing '0.25)


(require 'evil)
(require 'evil-leader)
(require 'evil-org)
(evil-mode 1)


(setq visual-fill-column-width 120)
(setq visual-fill-column-center-text t)
;; Give a little bit of whitespace around the edges of emacs. Delete this line if you
;; don't care for it.
(set-frame-parameter nil 'internal-border-width 10)

;; An override for this function to make inserting headings work
;; a bit better. Makes O respect heading content.
(defun shellhead/smart-org-insert ()
  "Creates a new heading if currently in a heading, creates a new list item 
   if in a list, or creates a newline if neither."
  (interactive)
  (cond
   ((org-at-heading-p) (org-insert-heading-respect-content) (evil-insert-state))
   ((org-at-item-p) (org-insert-item))))

(defun evil-org-eol-call (fun)
    "Go to end of line and call provided function.
  FUN function callback"
    (end-of-visible-line)
    (funcall fun)
    (evil-append nil)
    )

;; You need this line or else your cursor stays black, which is horrible for the dark themes:
;; http://stackoverflow.com/questions/9900232/changing-color-themes-emacs-24-order-matters?rq=1
(setq evil-default-cursor t) 

;; (global-visual-line-mode 1)
;; (global-visual-fill-column-mode)


(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
;; some error herree
;(setq org-indirect-buffer-display 'current-window)


(defun org-tree-open-in-right-frame ()
  (interactive)
  (org-tree-to-indirect-buffer)
  (windmove-right))

(add-hook 'org-mode-hook 

          (lambda ()

            ;; TODO: set fringe/gutter mode and theme by mode, no fringe and white them for ORG files
            ;; fringe and black theme for code
            (fringe-mode 0)
            
            ;; (set-frame-parameter (window-frame) 'background-mode 'dark)
            ;; (enable-theme 'leuven)

            (visual-fill-column-mode)
            (define-key evil-normal-state-local-map [S-return] (quote org-tree-open-in-right-frame))
            (define-key evil-normal-state-local-map [return] (quote org-tree-to-indirect-buffer))
            (local-set-key [3 25] 'org-copy-subtree)))
;; 24 25 is ctrl-c ctrl-y


;; This hides the bullets/asterisks in Org mode
;; Comment out if you want them back
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun hide-org-bullets ()                                 ;;
;;   (font-lock-add-keywords                                  ;;
;;    'org-mode `(("\\(?:^\\(?1:\\*+\\)[[:blank:]]\\)"        ;;
;;               (0 (progn (compose-region                    ;;
;;                          (match-beginning 1) (match-end 1) ;;
;;                          (pcase (length (match-string 1))  ;;
;;                            (1 ?\u2219)                     ;;
;;                            (2 ?\u2022)                     ;;
;;                            (3 ?\u25c9)                     ;;
;;                            (_ ?\u25CB)))                   ;;
;;                         nil))))))                          ;;
;; (hide-org-bullets)                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-startup-indented t)

(setq evil-want-C-u-scroll t)



(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


;;for global evil-visualstar
(global-evil-visualstar-mode)



;;for evil escape   similar to keychord.el
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)

(global-set-key (kbd "C-c C-g") 'evil-escape)


(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(define-key evil-normal-state-map (kbd "\C-p") nil)
(define-key evil-normal-state-map (kbd "\C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "q") nil)
(define-key evil-normal-state-map (kbd "<tab>") nil)
(define-key evil-normal-state-map (kbd ",") nil)
(define-key evil-motion-state-map (kbd "<SPC>") nil)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
;; (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(define-key evil-insert-state-map (kbd "C-h") 'evil-window-left)
;; (define-key evil-insert-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-insert-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-insert-state-map (kbd "C-l") 'evil-window-right)

;;Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)


;; turn off evil mode for the repl
(add-to-list 'evil-emacs-state-modes 'REPL)

(evil-leader/set-leader "<SPC>")
(global-evil-leader-mode)
(evil-leader/set-key
  "f" 'helm-find-files
  "b" 'helm-mini
  "-" 'text-scale-decrease
  "+" 'text-scale-increase
  "x" 'helm-M-x
  "r" 'helm-M-x
  "k" 'kill-buffer)

  ;"w" 'persp-switch
  ;"d" 'neotree-toggle ;; comment it
;; leader maps for org mode ;; increase orgmode
(evil-leader/set-key-for-mode 'org-mode
  "t"  'org-show-todo-tree
  "a"  'org-agenda
  "c"  'org-archive-subtree
  "l"  'evil-org-open-links
  "o"  'org-open-at-point
  "e"  'show-branches
)
