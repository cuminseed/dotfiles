;;;  Emacsオープニングを消す
(setq inhibit-startup-screen t)
;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)
;;; 最終行に必ず一行挿入する
(setq require-final-newline t)
;;; スクロールを1行単位でやる
(setq scroll-conservatively 1)
;;; 対応する括弧を光らせる。
(show-paren-mode 1)

;;; C-h で BackSpace
(global-set-key "\C-h" 'delete-backward-char)
;;; C-z でスクロールダウン
(global-set-key "\C-z" 'scroll-down)
;;; Ctrl-Alt-o で別ウィンドウ
(global-set-key "\C-\M-o" 'other-window)
;;; Alt-g で goto-line
(global-set-key "\M-g" 'goto-line)

;;; for dired
(eval-after-load "dired"
 '(progn
	(setq dired-recursive-copies 'always)
	(setq dired-recursive-deletes 'always)
	))
;;; diredでディレクトリを集める
(setq dired-listing-switches "-al --group-directories-first")

;;; カーソル動かさずにスクロール
(defun scroll-up-in-place (n)
  (interactive "p")
  (previous-line n)
  (scroll-down n))
(defun scroll-down-in-place (n)
  (interactive "p")
  (next-line n)
  (scroll-up n))
(global-set-key "\C-\M-p" 'scroll-up-in-place)
(global-set-key "\C-\M-n" 'scroll-down-in-place)

;;; menu bar is : File Edit Options Buffers Tools Emacs-Lisp Help
(menu-bar-mode -1)

;;; date
(defun date ()
  (interactive)
  (insert (concat (format-time-string "* %Y/%m/%d(%a) %H:%M:%S " ) ) ) )
(global-set-key "\C-\M-d" 'date)

;;; emacs automatically added below
(put 'narrow-to-region 'disabled nil)

;;; 190120 gauche on emacs
;; http://ayato.hateblo.jp/entry/20130710/1373448057
;; emacsでGauche
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "/usr/bin/gosh -i")

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun scheme-other-window ()
  "Run Gauche on other window"
  (interactive)
  (split-window-horizontally (/ (frame-width) 2))
  (let ((buf-name (buffer-name (current-buffer))))
    (scheme-mode)
    (switch-to-buffer-other-window
     (get-buffer-create "*scheme*"))
    (run-scheme scheme-program-name)
    (switch-to-buffer-other-window
     (get-buffer-create buf-name))))

(define-key global-map
  "\C-cG" 'scheme-other-window)

; 190223
(setq default-major-mode 'lisp-interaction-mode)

; Listing directory failed but access-file worked エラーの解消
(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))
