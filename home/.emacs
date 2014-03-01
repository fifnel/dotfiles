;;-------------------------------------------------------
;; 基本設定
;;-------------------------------------------------------

;; lispパスの設定
(setq load-path (append '("~/.emacs.d/site-lisp") load-path))

;; デフォルト文字コード
(set-default-coding-systems 'utf-8)

;; elispインストールスクリプト
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/site-lisp")

;; ビープを消す
(setq ring-bell-function 'ignore)

;; スタートアップページを表示しない
(setq inhibit-startup-message 1)

;; バックアップファイルを作らない
(setq backup-inhibited 1)

;; .saveファイルを作らない
(setq auto-save-list-file-name 0)
(setq auto-save-list-file-prefix 0)

;; 行数表示
(line-number-mode 1)
(column-number-mode 1)

;; ツールバーの非表示
(tool-bar-mode 0)

;; アンチエイリアス
(setq mac-allow-anti-aliasing 0)

;; yes/noではなくy/nにする
(fset 'yes-or-no-p 'y-or-n-p)

;; 終了時のバッファなどの状態を保存
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)
(define-key ctl-x-map "F" 'resume)                        ; C-x F で復元
(define-key ctl-x-map "K" 'wipe)                          ; C-x K で Kill
(add-hook 'kill-emacs-hook 'save-current-configuration)   ; 終了時に保存


;;-------------------------------------------------------
;; 操作設定
;;-------------------------------------------------------

;; C-hでバックスペース del
(keyboard-translate ?\C-h ?\C-?)
;(global-set-key "\C-h" 0)

;; C-kで改行も含める
(setq kill-whole-line 1)

;; C-lで行番号ジャンプ
(global-set-key "\C-l" 'goto-line) 

;; マウスのホイールスクロールスピードを調節
(global-set-key [wheel-up] '(lambda () "" (interactive) (scroll-down 1)))
(global-set-key [wheel-down] '(lambda () "" (interactive) (scroll-up 1)))
(global-set-key [double-wheel-up] '(lambda () "" (interactive) (scroll-down 1)))
(global-set-key [double-wheel-down] '(lambda () "" (interactive) (scroll-up 1)))
(global-set-key [triple-wheel-up] '(lambda () "" (interactive) (scroll-down 2)))
(global-set-key [triple-wheel-down] '(lambda () "" (interactive) (scroll-up 2)))


;;-------------------------------------------------------
;; エディタ設定
;;-------------------------------------------------------

;; C/Migemo
(load "migemo.el")
(setq migemo-command "/opt/local/bin/cmigemo")
(setq migemo-options '("-q" "--emacs" "¥a"))
(setq migemo-dictionary "/opt/local/share/migemo/euc-jp/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)

;; タブの設定
(setq default-tab-width 4)

;; 全自動インデントを有効
;(setq c-auto-newline 1)
(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent)
;(global-set-key "\C-m" 'indent-new-comment-line)

;; dired-xを使う
(require 'dired-x)
(add-hook 'dired-load-hook (lambda () (require 'dired-x)))

;; diredでQuickLookを使う
(setq dired-load-hook '(lambda () (load "dired-x")))
(setq dired-guess-shell-alist-user
  '(("\\.png" "qlmanage -p")
    ("\\.jpg" "qlmanage -p")
    ("\\.xls" "qlmanage -p")
    ("\\.pdf" "qlmanage -p")))

;; kill-ringの一覧を見ながらyank
(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

;; バッファ切り替えをインクリメンタルで
(iswitchb-mode 1)

;; 対応する括弧を光らせる
(show-paren-mode 1)


;;-------------------------------------------------------
;; デザイン
;;-------------------------------------------------------

;; デフォルトの透明度を設定する
(add-to-list 'default-frame-alist '(alpha . 95))

;; カレントウィンドウの透明度を変更する
(set-frame-parameter nil 'alpha 95)

;; 左右の余白をなくす
(fringe-mode 0)

;; ステータスバーに時刻表時
(display-time-mode 1)

;; 行番号の表示
(autoload 'setnu-mode "setnu" nil t)
(global-set-key [f12] 'setnu-mode)

;; 行ハイライト
(require 'hl-line+)
(toggle-hl-line-when-idle 1)

;; 行の折り返しをしない
(set-default 'truncate-lines 1)

;; 行列番号表示
(line-number-mode 1)
(column-number-mode 1)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; ウィンドウ初期状態
(setq initial-frame-alist
      (append (list
               '(width . 120) ;; ウィンドウ幅
               '(height . 40) ;; ウィンドウの高さ
               '(top . 0) ;;表示位置
               '(left . 140) ;;表示位置
               )
              initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;;; shell-mode でエスケープを綺麗に表示
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
   "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; フォント設定
(setq my-font "-*-*-medium-r-normal--12-*-*-*-*-*-fontset-hiramaru")
(setq fixed-width-use-QuickDraw-for-ascii t)
(setq mac-allow-anti-aliasing t)
(if (= emacs-major-version 22)
    (require 'carbon-font))
(set-default-font my-font)
(add-to-list 'default-frame-alist `(font . ,my-font))
(when (= emacs-major-version 23)
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0208
   '("Hiragino Maru Gothic ProN" . "iso10646-1"))
  (setq face-font-rescale-alist
	'(("^-apple-hiragino.*" . 1.2)
	  (".*osaka-bold.*" . 1.2)
	  (".*osaka-medium.*" . 1.2)
	  (".*courier-bold-.*-mac-roman" . 1.0)
	  (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	  (".*monaco-bold-.*-mac-roman" . 0.9)
	  ("-cdac$" . 1.3))))
 	
;; タブや全角スペースの可視化
(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "gray28"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; 基本的な色設定
(add-to-list 'default-frame-alist '(foreground-color . "white"))
(add-to-list 'default-frame-alist '(background-color . "gray20"))
(add-to-list 'default-frame-alist '(cursor-color . "GreenYellow"))
(add-to-list 'default-frame-alist '(mouse-color . "white"))
(set-face-foreground 'modeline "gray10")
(set-face-background 'modeline "gray80")
(set-face-background 'region "gray40")
(set-face-foreground 'mode-line-inactive "gray30")
(set-face-background 'mode-line-inactive "gray85")

;; ソースコードの色設定
(set-face-foreground 'font-lock-comment-face "SpringGreen")
(set-face-foreground 'font-lock-string-face  "lemonchiffon")
(set-face-foreground 'font-lock-keyword-face "cyan")
(set-face-foreground 'font-lock-function-name-face "cyan")
(set-face-foreground 'font-lock-variable-name-face "white")
(set-face-foreground 'font-lock-type-face "cyan")
(set-face-foreground 'font-lock-builtin-face "cyan")
(set-face-foreground 'font-lock-constant-face "white")
(set-face-foreground 'font-lock-warning-face "cyan")

;;-------------------------------------------------------
;; 各モード設定
;;-------------------------------------------------------

;; shell-mode
;上下でヒストリ補完
(add-hook 'shell-mode-hook
   (function (lambda ()
      (define-key shell-mode-map [up] 'comint-previous-input)
      (define-key shell-mode-map [down] 'comint-next-input))))

;; c/c++, java mode
(autoload 'c++-mode  "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode    "cc-mode" "C Editing Mode" t)
(autoload 'java-mode "cc-mode" "Java Editing Mode" t)
(setq c-tab-always-indent t)
(setq c-default-style "bsd")
(setq c-block-comments-indent-p 3)
(setq c-basic-offset  4)

;; HTML mode
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;(autoload 'asp-html-helper-mode "html-helper-mode" "Yay HTML" t)
;(autoload 'jsp-html-helper-mode "html-helper-mode" "Yay HTML" t)
;(add-to-list 'auto-mode-alist '("\\.s?html?$" . html-helper-mode))
;(setq html-helper-verbose 0)
;; html-helper-mode の設定
(add-hook 'html-helper-load-hook '(lambda () (require 'html-font)))
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist 
      (append '(("\\.html$" . html-helper-mode)
		("\\.shtml$" . html-helper-mode)
		("\\.html$" . html-helper-mode)
		("\\.shtml$" . html-helper-mode)
		) auto-mode-alist))


;; PHP mode
;(require 'php-mode)
(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php$" . html-helper-mode))

;; CSS mode
(autoload 'css-mode "css-mode" "Cascading Style Sheet editing mode" t)
(setq auto-mode-alist
      (cons '("\\.css$" . css-mode) auto-mode-alist))

;; perl mode
(autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
(setq cperl-indent-level 4)
(setq cperl-continued-statement-offset 4)
(setq cperl-comment-column 40)


;;-------------------------------------------------------
;; ユーティリティ
;;-------------------------------------------------------

;; カーソルのある場所の数値をインクリメントする
(defun my-increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789")
        (when (re-search-forward "[0-9]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 10 field-width) answer)))
          (replace-match (format (concat "%0" (int-to-string field-width) "d")
                                 answer)))))))
(global-set-key (kbd "C-c +") 'my-increment-number-decimal)


;; バッファ移動を簡単に
;; http://www-tsujii.is.s.u-tokyo.ac.jp/~yoshinag/tips/elisp_tips.html#buffer
(defvar my-ignore-blst             ; 移動の際に無視するバッファのリスト
  '("*Help*" "*Compile-Log*" "*Mew completions*" "*Completions*"
    "*Shell Command Output*" "*Apropos*" "*Buffer List*"))
(defvar my-visible-blst nil)       ; 移動開始時の buffer list を保存
(defvar my-bslen 15)               ; buffer list 中の buffer name の最大長
(defvar my-blist-display-time 2)   ; buffer list の表示時間
(defface my-cbface                 ; buffer list 中で current buffer を示す face
  '((t (:foreground "wheat" :underline t))) nil)

(defun my-visible-buffers (blst)
  (if (eq blst nil) '()
    (let ((bufn (buffer-name (car blst))))
      (if (or (= (aref bufn 0) ? ) (member bufn my-ignore-blst))
          ;; ミニバッファと無視するバッファには移動しない
          (my-visible-buffers (cdr blst))
        (cons (car blst) (my-visible-buffers (cdr blst)))))))

(defun my-show-buffer-list (prompt spliter)
  (let* ((len (string-width prompt))
         (str (mapconcat
               (lambda (buf)
                 (let ((bs (copy-sequence (buffer-name buf))))
                   (when (> (string-width bs) my-bslen) ;; 切り詰め 
                     (setq bs (concat (substring bs 0 (- my-bslen 2)) "..")))
                   (setq len (+ len (string-width (concat bs spliter))))
                   (when (eq buf (current-buffer)) ;; 現在のバッファは強調表示
                     (put-text-property 0 (length bs) 'face 'my-cbface bs))
                   (cond ((>= len (frame-width)) ;; frame 幅で適宜改行
                          (setq len (+ (string-width (concat prompt bs spliter))))
                          (concat "\n" (make-string (string-width prompt) ? ) bs))
                         (t bs))))
               my-visible-blst spliter)))
    (let (message-log-max)
      (message "%s" (concat prompt str))
      (when (sit-for my-blist-display-time) (message nil)))))

(defun my-operate-buffer (pos)
  (unless (window-minibuffer-p (selected-window));; ミニバッファ以外で
    (unless (eq last-command 'my-operate-buffer)
      ;; 直前にバッファを切り替えてなければバッファリストを更新
      (setq my-visible-blst (my-visible-buffers (buffer-list))))
    (let* ((blst (if pos my-visible-blst (reverse my-visible-blst))))
      (switch-to-buffer (or (cadr (memq (current-buffer) blst)) (car blst))))
    (my-show-buffer-list (if pos "[-->] " "[<--] ") (if pos " > "  " < " )))
  (setq this-command 'my-operate-buffer))

(global-set-key [?\C-<] (lambda () (interactive) (my-operate-buffer nil)))
(global-set-key [?\C-,] (lambda () (interactive) (my-operate-buffer t)))


;;-------------------------------------------------------
;; howm
;;-------------------------------------------------------

;; 初期設定
(add-to-list 'load-path "~/.emacs.d/site-lisp/howm/")
(setq howm-menu-lang 'ja)
(require 'howm)
(custom-set-variables
 '(howm-directory "~/Documents/howm/")
 '(howm-list-recent-days 30)
 '(howm-view-use-grep t))

;; リンクを TAB で辿る
(eval-after-load "howm-mode"
  '(progn
     (define-key howm-mode-map [tab] 'action-lock-goto-next-link)
     (define-key howm-mode-map [(meta tab)] 'action-lock-goto-previous-link)
))

;; RET でファイルを開く際, 一覧バッファを消す
;; C-u RET なら残る
;(setq howm-view-summary-persistent nil)

;; メニューを自動更新しない(保存時待たされるので)
;(setq howm-menu-refresh-after-save nil)

;; 下線を引き直さない(保存時待たされるので)
;(setq howm-refresh-after-save nil)

;; メニューを 2 時間キャッシュ
;(setq howm-menu-expiry-hours 2)

;; TODOに済みを表示しない
(setq howm-todo-menu-types "[-+~!]")

;; メニューの予定表の表示範囲
(setq howm-menu-schedule-days-before 7)
(setq howm-menu-schedule-days 30)


;; ファイル内容が 0 ならファイルごと削除する
(if (not (memq 'delete-file-if-no-contents after-save-hook))
    (setq after-save-hook
          (cons 'delete-file-if-no-contents after-save-hook)))
(defun delete-file-if-no-contents ()
  (when (and
         (buffer-file-name (current-buffer))
         (string-match "\\.howm" (buffer-file-name (current-buffer)))
         (= (point-min) (point-max)))
    (delete-file
     (buffer-file-name (current-buffer)))))

;; C-cC-c で保存してバッファをキルする
(defun my-save-and-kill-buffer ()
  (interactive)
  (when (and
         (buffer-file-name)
         (string-match "\\.howm"
                       (buffer-file-name)))
    (save-buffer)
    (kill-buffer nil)))
(eval-after-load "howm"
  '(progn
     (define-key howm-mode-map
       "\C-c\C-c" 'my-save-and-kill-buffer)))

;; M-x calendarから日付入力
(eval-after-load "calendar"
  '(progn
     (define-key calendar-mode-map
       "\C-m" 'my-insert-day)
     (defun my-insert-day ()
       (interactive)
       (let ((day nil)
             (calendar-date-display-form
         '("[" year "-" (format "%02d" (string-to-int month))
           "-" (format "%02d" (string-to-int day)) "]")))
         (setq day (calendar-date-string
                    (calendar-cursor-to-date t)))
         (exit-calendar)
         (insert day)))))

;; 日付の簡易入力
(defun my-get-date-gen (form)
  (insert (format-time-string form)))
(defun my-get-date ()
  (interactive)
  (my-get-date-gen "[%Y-%m-%d]"))
(defun my-get-time ()
  (interactive)
  (my-get-date-gen "[%H:%M]"))
(defun my-get-dtime ()
  (interactive)
  (my-get-date-gen "[%Y-%m-%d %H:%M]"))
(global-set-key "\C-c\C-d" 'my-get-date)
(global-set-key "\C-c\C-t" 'my-get-time)
(global-set-key "\C-c\ed" 'my-get-dtime)


;; howmでアウトライン
(autoload 'howm-mode
  "howm-mode" "Hitori Otegaru Wiki Modoki" t)
(defadvice howm-mode
  (before outline-minor activate)
  (outline-minor-mode t))
(require 'outline)
(defun my-outline-flip-subtree (&optional dummy)
  (interactive)
  (if (save-excursion
        (forward-line 1)
        (let ((p (overlays-at (line-beginning-position)))
              (ol nil))
          (while (and p (not ol))
            (setq ol (overlay-get (car p) 'invisible))
            (setq p (cdr p)))
          ol))
      (show-subtree)
    (hide-subtree)))
(defun add-my-action-lock-rule ()
  (let ((rule
         (action-lock-general
          'my-outline-flip-subtree
          (if (and
               buffer-file-name
               (string-match "\\.howm$" buffer-file-name))
              "^ *\\(\\*\\**\\)"
            (concat "\\(" outline-regexp "\\)"))
          1 1)))
    (if (not (member rule action-lock-default-rules))
        (progn (setq action-lock-default-rules
                     (cons rule action-lock-default-rules))
               (action-lock-set-rules action-lock-default-rules)))))
(add-hook 'action-lock-mode-on-hook 'add-my-action-lock-rule)
 	
;; 色設定
(custom-set-faces
 '(howm-mode-title-face ((((class color)) (:foreground "Cyan"))))
 '(howm-reminder-normal-face ((((class color)) (:foreground "cyan")))))
