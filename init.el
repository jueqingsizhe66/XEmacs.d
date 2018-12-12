;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'package-archives                                         ;;
;;              '("org" . "http://orgmode.org/elpa/") t)                  ;;
;;                                                                 ;;
;; (add-to-list 'package-archives                                         ;;
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'package-archives                             ;;
;;              '("melpa" . "https://melpa.org/packages/") t) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa-stable.milkbox.net/packages/")))
;(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ("marmalada" . "http://elpa.emacs-china.org/marmalade/")))
;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)
(setq temporary-file-directory "C:/Users/yzl/AppData/Local/Temp/") 
;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; Define he following variables to remove the compile-log warnings
;; when defining ido-ubiquitous
(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)


;;;windows system
;;fuck notify you for settning https://github.com/sriramkswamy/ryo-emacs/blob/master/init.el
(setq coding-system-for-read 'utf-8)										  	; use utf-8 by default for reading
(setq coding-system-for-write 'utf-8)
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq-default pathname-coding-system 'utf-8)
(setq default-process-coding-system 
            '(utf-8 . utf-8))
(set-buffer-file-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;(set-clipboard-coding-system 'utf-8)

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    expand-region
    
   ;; auto-complete
    dracula-theme ;; color schme
    hlinum
    which-key
    restclient;;;restclinet mode
    browse-kill-ring

     ;;neotree;;file list
     ;;all-the-icons   ;;;you need to download fonts

     session
     markdown-mode+
     evil-surround
     ivy
     ivy-rich
     cal-china-x
    ;;complete anything
     company
     key-chord
     iy-go-to-char
     ace-jump-mode

     htmlize
     highlight-escape-sequences
     move-text

     flycheck
     flycheck-pos-tip
     flycheck-clojure
    ; use-package
     org-journal
     org-bullets
     org-tree-slide
     org-autolist
     ;;music
     emms
    ))

;; on OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))



;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations/")
;;for magnars folders
(add-to-list 'load-path "~/.emacs.d/customizations/magnars/")
(add-to-list 'load-path "~/.emacs.d/customizations/my_plugins/color-rg/")
(add-to-list 'load-path "~/.emacs.d/customizations/my_plugins/git-timemachine/")
(add-to-list 'load-path "~/.emacs.d/customizations/my_plugins/Highlight-Indentation-for-Emacs")
;(add-to-list 'load-path "~/.emacs.d/customizations/alphapapa/")
;;(set-fontset-font t 'han (font-spec :family "Microsoft Yahei" :size 16)
(load "font-lock+.el")
;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")
(load "scheme-editing.el")
(load "setup-ledger.el")

;; Langauage-specific
;(load "setup-clojure.el")
(load "setup-autoinsert.el")
;(load "setupsbcl.el")
(load "setup-js.el")
(load "setup-eshell.el")
(load "setup-rust.el")
(load "fortran-editing.el")
(load "fortran-index-args.el")
(load "setup-ruby-mode.el")
(load "ruby-end.el")
(load "setup-find-file-in-project.el")
(load "setup-python.el")
(load "setup-git.el")

;(load "highlight-indentation.el")
(require 'highlight-indentation)
(require 'color-rg)
(require 'git-timemachine)
;(load "color-rg.el")
;(load "find-file-in-project.el")

;(load "orca.el")
;(load "org-wiki.el")
;(load "doom-todo-ivy.el")

;dashboard
;(load "setup-dashboard.el")

;;(require 'server)

(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert (quote other))
 '(auto-insert-alist
   (quote
    ((("\\.\\([Hh]\\|hh\\|hpp\\)\\'" . "C / C++ header")
      .
      ["template.h" c++-mode my/autoinsert-yas-expand])
     (("\\.sh\\'" . "Shell script")
      .
      ["sh-template.sh" my/autoinsert-yas-expand])
     (("\\.el\\'" . "Emacs Lisp")
      .
      ["template.el" my/autoinsert-yas-expand])
     (("\\.org\\'" . "org-mode")
      .
      ["org-template.org" my/autoinsert-yas-expand])
     (("\\.pm\\'" . "Perl module")
      .
      ["template.pm" my/autoinsert-yas-expand])
     (("\\.py\\'" . "Python script")
      .
      ["py-template.py" my/autoinsert-yas-expand])
     (("\\.tex\\'" . "TeX/LaTeX")
      .
      ["template.tex" my/autoinsert-yas-expand]))))
 '(auto-insert-directory "~/.emacs.d/template/")
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(canlock-password "9d4c00813f66a64dfd7ed230bf179494796588e6")
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "e297f54d0dc0575a9271bb0b64dad2c05cff50b510a518f5144925f627bb5832" default)))
 '(describe-char-unidata-list
   (quote
    (name old-name general-category decomposition numeric-value iso-10646-comment uppercase lowercase titlecase)))
 '(eww-search-prefix " https://cn.bing.com/search?q=")
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(git-gutter:added-sign "☀")
 '(git-gutter:deleted-sign "☂")
 '(git-gutter:diff-option "-w")
 '(git-gutter:handled-backends (quote (svn hg git)))
 '(git-gutter:lighter " GG")
 '(git-gutter:modified-sign "☁")
 '(git-gutter:separator-sign "|")
 '(git-gutter:update-interval 2)
 '(git-gutter:window-width 2)
 '(ispell-dictionary "british")
 '(ispell-program-name "C:\\Program Files (x86)\\Aspell\\bin\\aspell.exe")
 '(muse-project-alist
   (quote
    (("WikiPlanner"
      ("~/.emacs.d/GTD/myPlan/" :default "index" :major-mode planner-mode :visit-link planner-visit-link)))))
 '(org-agenda-files
   (quote
    ("~/.emacs.d/GTD/phd1.org" "~/.emacs.d/GTD/OrgBoss/Journal/20180921" "~/.emacs.d/GTD/orgBoss/newgtd.org" "~/.emacs.d/GTD/orgBoss/Book/book.org" "~/.emacs.d/GTD/orgBoss/Clipboard/clipboard.org" "~/.emacs.d/GTD/orgBoss/DailyReview/daily.org" "~/.emacs.d/GTD/orgBoss/Financial/finances.org" "~/.emacs.d/GTD/orgBoss/Film/film.org" "~/.emacs.d/GTD/orgBoss/IDEA/idea.org" "~/.emacs.d/GTD/orgBoss/Journal/journal.org" "~/.emacs.d/GTD/orgBoss/Private/privnotes.org" "~/.emacs.d/GTD/orgBoss/Someday/someday.org" "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org" "~/.emacs.d/GTD/orgBoss/Site/www.site.org" "~/.emacs.d/GTD/orgBoss/writing.org" "~/.emacs.d/GTD/orgBoss/Habit/habits.org" "~/.emacs.d/GTD/Dissertation.org" "~/.emacs.d/GTD/thesis-proposal.org" "~/.emacs.d/GTD/orgBoss/pythonLearning.org" "~/.emacs.d/GTD/orgBoss/perlLearning.org" "~/.emacs.d/GTD/orgBoss/clojureLearning.org" "~/.emacs.d/GTD/orgBoss/rubyLearning.org")))
 '(org-agenda-ndays 1)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda time-up priority-down tag-up)
     (todo tag-up))))
 '(org-agenda-todo-ignore-deadlines t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-deadline-warning-days 7)
 '(package-selected-packages
   (quote
    (visual-fill elisp-format ht company-anaconda anaconda-mode elpy all-the-icons-dired all-the-icons-ivy doom-themes doom-modeline yasnippet-snippets persp-projectile perspective projectile-rails projectile-ripgrep counsel-projectile persp-mode-projectile-bridge evil-leader evil-org py-autopep8 python-pylint pylint exec-path-from-shell cider-eval-sexp-fu helm-cider-history helm-cider cider-decompile super-save srcery-theme magit evil-mc-extras evil-mc youdao-dictionary nlinum-relative nlinum rg ivy-xref flx ivy-bibtex ripgrep artbollocks-mode plantuml-mode beginend link-hint helm-eww log4j-mode language-detection eww-lnum clj-refactor howm deft ace-link 4clojure evil-vimish-fold origami scribble-mode ac-geiser geiser ascii-art-to-unicode visual-ascii-mode org-brain suggest counsel-world-clock ivy-yasnippet helpful abyss-theme ledger-mode flycheck-ledger org-agenda-property org-link-minor-mode org-dashboard dashboard page-break-lines writeroom-mode poporg org-mru-clock epresent xpm window-numbering evil-visualstar git-timemachine git-gutter org-wild-notifier dumb-diff fringe-current-line ag highlight-indentation ruby-end ruby-tools ruby-refactor cljr-helm org-bookmark-heading org-alert org-mind-map spaceline dired-narrow dired-rainbow dired-subtree emms sotclojure sotlisp ox-reveal pretty-symbols org-journal org-autolist org-babel-eval-in-repl org-bullets request-deferred fortpy flycheck-clojure spacemacs-theme w3m use-package simplezen zencoding-mode move-text highlight-escape-sequences dired-details+ dired+ ace-jump-mode paredit-menu iy-go-to-char key-chord string-edit flycheck-perl6 company cal-china-x image+ 2048-game 0xc ivy-rich ivy-dired-history ivy smart-mode-line mo-git-blame evil-surround markdown-mode+ scheme-complete 0blayout org-plus-contrib cl-lib-highlight tagedit smex rainbow-delimiters paredit ido-ubiquitous clojure-mode-extra-font-locking cider)))
 '(send-mail-function (quote smtpmail-send-it))
 '(session-use-package t nil (session))
 '(smtpmail-smtp-server "smtp.163.com")
 '(smtpmail-smtp-service 25))


;; https://ambrevar.xyz/emacs2/
;;; Temporarily reduce garbage collection during startup. Inspect `gcs-done'.
(defun ambrevar/reset-gc-cons-threshold ()
  (setq gc-cons-threshold (car (get 'gc-cons-threshold 'standard-value))))
(setq gc-cons-threshold (* 64 1024 1024))
(add-hook 'after-init-hook #'ambrevar/reset-gc-cons-threshold)

;;; Temporarily disable the file name handler.
(setq default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(defun ambrevar/reset-file-name-handler-alist ()
  (setq file-name-handler-alist
	(append default-file-name-handler-alist
		file-name-handler-alist))
  (cl-delete-duplicates file-name-handler-alist :test 'equal))
(add-hook 'after-init-hook #'ambrevar/reset-file-name-handler-alist)
(setq load-prefer-newer t)

; (load
;  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
; 'noerror)
;
(setq default-directory "~/.emacs.d/")
; (require 'org-install)
;


;; my personal setup, other major-mode specific setup need it.
;; It's dependent on init-site-lisp.el
(if (file-exists-p "~/.emacs.d/.custom.el") (load-file "~/.emacs.d/.custom.el"))
(if (file-exists-p "~/.emacs.d/.orgConf.el") (load-file "~/.emacs.d/.orgConf.el"))


(require 'quantified)
;;不起作用
;(if (server-running-p)
;"server-running"
;(server-start))



;; music
(load "setup-emms.el")
(eval-after-load 'dired '(require 'setup-dired))
(require 'setup-yasnippet)
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))
(require 'setup-html-mode)
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'html-mode '(require 'zencoding-mode))
(eval-after-load 'flycheck '(require 'setup-flycheck))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (eval-when-compile       ;;
;;  (require 'use-package)) ;;
;;; 设置编辑环境
(set-language-environment 'utf-8)

(global-set-key (kbd "C-x C-e") 'eval-last-sexp)
(toggle-truncate-lines 1)
  

(eval-after-load 'eww-mode (load "setup-eww.el"))

(load "init-const.el")      ;;
(load "init-utils.el")      ;;

(load "init-projectile.el") ;;
(load "init-ivy.el")        ;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :foreground "#9F5F9F" :font "Source Sans Pro" :height 1.4 :underline nil))))
 '(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon" :strike-through t))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#FCE8C3" :font "Source Sans Pro" :height 1.5))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#FCE8C3" :font "Source Sans Pro" :height 1.25))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#FCE8C3" :font "Source Sans Pro" :height 1.15))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#FCE8C3" :font "Source Sans Pro" :height 1.05))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#FCE8C3" :font "Source Sans Pro"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#FCE8C3" :font "Source Sans Pro"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#FCE8C3" :font "Source Sans Pro"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#FCE8C3" :font "Source Sans Pro")))))

(global-visual-line-mode)
(global-visual-fill-column-mode)

