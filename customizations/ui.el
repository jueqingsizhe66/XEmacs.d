;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)

(tool-bar-mode -1)
;; Show line numbers
;;(global-linum-mode)
;;(global-linum-mode -1)
(global-nlinum-mode 1)
;(global-nlinum-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package nlinum-relative                                                                 ;;
;;     :config                                                                                  ;;
;;     ;; something else you want                                                               ;;
;;     (nlinum-relative-setup-evil)                                                             ;;
;;     (add-hook 'prog-mode-hook 'nlinum-relative-mode)                                         ;;
;;     (setq nlinum-relative-redisplay-delay 0)      ;; delay                                   ;;
;;     (setq nlinum-relative-current-symbol "->")      ;; or "" for display current line number ;;
;;     (setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...              ;;
;; )                                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
;; (when (fboundp 'tool-bar-mode)
;;   (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes/spacemacs-theme")
;(load-theme 'tomorrow-night-bright t)
;(load-theme 'spacemacs-dark t)
;(load-theme 'srcery t)
(load-theme 'doom-dracula t)
  (setq spacemacs-theme-org-agenda-height nil)
  (setq spacemacs-theme-org-height nil)
;; set sizes here to stop spacemacs theme resizing these



;(load-theme 'dracula t)
;; workaround blue problem https://github.com/bbatsov/solarized-emacs/issues/18
(custom-set-faces
(if (not window-system)
  '(default ((t (:background "nil"))))))

;; increase font size for better readability
(set-face-attribute 'default nil :height 140)

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)


;;设置我所在地方的经纬度，calendar里有个功能是日月食的预测，和你的经纬度相联系的。
;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
;;; cal-china-x
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq other-holidays '())
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq cal-china-x-general-holidays '(
                                     (holiday-lunar 1 1 "新年")
                                     (holiday-lunar 1 15 "元宵节")
                                     (holiday-lunar 2 2 "头牙(龙抬头 春耕节)")
                                     (holiday-lunar 4 4 "寒食节")
                                     (holiday-lunar 4 5 "清明节")
                                     (holiday-lunar 5 5 "端午节")
                                     (holiday-lunar 6 1 "半年节")
                                     (holiday-lunar 7 7 "七夕节")
                                     (holiday-lunar 7 15 "中元节")
                                     (holiday-lunar 8 15 "中秋节")
                                     (holiday-lunar 9 9 "重阳节")
                                     (holiday-lunar 10 1 "寒衣节(祭祖)")
                                     (holiday-lunar 10 15 "下元节")
                                     (holiday-lunar 12 8 "腊八节")
                                     (holiday-lunar 12 22 "冬至")
                                     (holiday-lunar 12 24 "祭灶")
                                     (holiday-lunar 12 30 "除夕")
                                     (holiday-lunar 7 24 "中元节")
                                     (holiday-lunar 7 24 "中元节")
                                     ; (holiday-fixed 1 1 "元旦")
                                     ; (holiday-fixed 2 14 "情人节")
                                     ; (holiday-fixed 3 14 "白色情人节")
                                     ; (holiday-fixed 4 1 "愚人节")
                                     ; (holiday-fixed 5 1 "劳动节")
                                     ; (holiday-fixed-float 5 0 2 "母亲节")
                                     ; (holiday-fixed 6 1 "儿童节")
                                     ; (holiday-fixed-float 6 0 3 "父亲节")
                                     ; (holiday-fixed 7 1 "建党节")
                                     ; (holiday-fixed 8 1 "建军节")
                                     ; (holiday-fixed 9 10 "教师节")
                                     ; (holiday-fixed 10 1 "国庆节")
                                     ; (holiday-fixed 12 25 "圣诞节")
                                     ; (holiday-fixed 7 4 "结婚纪念日")
                                     ))
(setq calendar-holidays
      (append cal-china-x-important-holidays
              cal-china-x-general-holidays
              other-holidays))

;;;;cal-china-x

;;;; move here from navigation.el
;; in the digital keyboard add calendar and bookmark
(global-set-key (kbd "<kp-7>") 'calendar)
(global-set-key  (kbd "<kp-8>") 'list-bookmarks)
(setq bookmark-save-flag 1) ;; everytime bookmark is changed, automatically save it
(setq bookmark-save-flag t) ;; save bookmark when emacs quit

;;;; move  end
 
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1) ; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t) ; 标记calendar上有diary的日期
(setq mark-holidays-in-calendar nil) ; 为了突出有diary的日期，calendar上不标记节日
(setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日

;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)

(setq diary-file "~/.emacs.d/CalendarDairy/diary.org");; 默认的日记文件
(setq diary-mail-addr "zhaoturkkey@163.com")
;(nyan-mode t)

(use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))


;; How tall the mode-line should be (only respected in GUI Emacs).
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be (only respected in GUI Emacs).
(setq doom-modeline-bar-width 3)
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

;; What executable of Python will be used (if nil nothing will be showed).
(setq doom-modeline-python-executable "python")

;; Whether show `all-the-icons' or not (if nil nothing will be showed).
;; The icons may not be showed correctly on Windows. Disable to make it work.
(setq doom-modeline-icon t)

;; Whether show the icon for major mode. It should respect `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Don’t compact font caches during GC.
;; If you are expereicing the laggy issue especially on Windows, please set to
;; non-nil.
(setq inhibit-compacting-font-caches t)
;(use-package all-the-icons)



(use-package all-the-icons-ivy
  :ensure t
  :config
  (all-the-icons-ivy-setup))
;(setq all-the-icons-ivy-buffer-commands '())
(setq all-the-icons-ivy-file-commands
      '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir))
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
