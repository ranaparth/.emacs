;;; package --- summary:
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 25)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight corresponding parentheses when cursor is on one
(show-paren-mode t)

;; Highlight tabulations
(setq-default highlight-tabs t)

;; Show trailing white spaces
(setq-default show-trailing-whitespace t)

;; Set locale to UTF8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;exchanging meta key and super key
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;;Setting ivy
(ivy-mode 1)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key "\M-" 'hippie-expand)

;;Kill this buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;Multiple Cursor
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;projectile
(require 'projectile)
(projectile-mode 1)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'ivy)
(global-set-key (kbd "M-p") 'projectile-find-file)

;;Expand region bug
(setq shift-select-mode nil)

(exec-path-from-shell-initialize)

;;Company Mode
;;(add-hook 'after-init-hook 'global-company-mode)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-line
        try-expand-list
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
(global-set-key (kbd "M-/") 'hippie-expand)


;;Expand Region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;powerline
(require 'powerline)
(powerline-default-theme)

;;customizing font-size
(set-face-attribute 'default nil :height 144)

;;swiper configuration
(use-package swiper
  :bind ("C-s" . swiper))

;;gtags
;; (ggtags-mode 1)

;;smartparens
(require 'smartparens-config)

;;golden-ratio
(require 'golden-ratio)
(golden-ratio-mode 1)

(setq js-indent-level 2)
;;Storing backup files in temporary directory
;;Store all backup and autosave files in the tmp dir
(setq backup-directory-alist '(("." . "~/.emacs-backup")))
;;(setq backup-directory-alist
;;      `((".*" . ,temporary-file-directory)))
;;(setq auto-save-file-name-transforms
;;      `((".*" ,temporary-file-directory t)))

(put 'narrow-to-region 'disabled nil)
(setq whitespace-line -1)
(setq whitespace-style '(face tabs empty trailing lines-tail))
(global-whitespace-mode)
(setq ns-use-srgb-colorspace 'nil)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq vc-handled-backends nil)
(setq-default indent-tabs-mode nil)
(remove-hook 'find-file-hooks 'vc-find-file-hook)
(remove-hook 'find-file-hook 'vc-refresh-state)
(remove-hook 'after-save-hook 'vc-find-file-hook)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;(add-to-list 'default-frame-alist '(background-mode . dark))
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/themes")
;; (set-frame-parameter nil 'background-mode 'dark)
;; (require 'doom-themes)
;; (load-theme 'doom-one t)
(load-theme 'sanityinc-solarized-dark t)
;;(load-theme 'solarized-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "cdf96318f1671344564ba74ef75cc2a3f4692b2bee77de9ce9ff5f165de60b1f" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (visual-regexp zenburn-theme anzu phpcbf exec-path-from-shell counsel-gtags ggtags color-theme-sanityinc-solarized golden-ratio counsel ac-cake smartparens expand-region multiple-cursors elpy ido-ubiquitous flycheck web-mode php-mode powerline swiper use-package)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(powerline-height nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#042028" :foreground "#708183" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "nil" :family "DejaVu Sans Mono for Powerline")))))

(provide 'init)
;;; .emacs ends here
