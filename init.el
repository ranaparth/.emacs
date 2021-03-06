;;; package --- summary:
;;; Commentary:
;;; Code:
(require 'package)
(let*
    ((no-ssl (and (memq system-type '(windows-nt ms-dos)) (not (gnutls-available-p))))
     (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
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

;; Enable org-mode
(require 'org)

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

;;Kill this buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;Dumb Jump Mode
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g q" . dumb-jump-quick-look)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy)
  :ensure)

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

;; Browse Kill ring
(global-set-key (kbd "C-x M-k") 'browse-kill-ring)
(global-set-key (kbd "M-y") 'counsel-yank-pop)

;; Neotree
(require 'neotree)
(global-set-key (kbd "C-x t") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; All the icons
(require 'all-the-icons)

;; Beacon
(beacon-mode 1)

;; Anzu
(anzu-mode +1)

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

;; Spaceline
(require 'spaceline-config)
;; (spaceline-emacs-theme)
(setq x-underline-at-descent-line t)
(set-face-attribute 'mode-line nil :box nil :underline nil)
(set-face-attribute 'mode-line-inactive nil :box nil :underline nil)
(require 'spaceline-all-the-icons)
(spaceline-all-the-icons-theme)
(spaceline-all-the-icons--setup-neotree)

;; Smooth scroll
(require 'smooth-scroll)
(smooth-scroll-mode t)
(setq smooth-scroll/vscroll-step-size 8)

;; Paradox
(require 'paradox)
(paradox-enable)

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
(setq golden-ratio-adjust-factor .8
      golden-ratio-wide-adjust-factor .8)

(setq js-indent-level 4)

;; Storing backup files in temporary directory
;; Store all backup and autosave files in the tmp dir
;; (setq backup-directory-alist '(("." . "~/.emacs-backup")))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

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
;; (load-theme 'sanityinc-solarized-dark t)
(load-theme 'solarized t)

;; Custom variables
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
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("5e52ce58f51827619d27131be3e3936593c9c7f9f9f9d6b33227be6331bf9881" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "cdf96318f1671344564ba74ef75cc2a3f4692b2bee77de9ce9ff5f165de60b1f" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
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
    (org-pomodoro markdown-mode async paradox smooth-scroll projectile browse-kill-ring flymake-go beacon go-mode spaceline-all-the-icons spaceline all-the-icons neotree solarized-theme color-theme-solarized dumb-jump org-bullets org visual-regexp anzu phpcbf exec-path-from-shell counsel-gtags ggtags golden-ratio counsel ac-cake smartparens expand-region multiple-cursors elpy ido-ubiquitous flycheck web-mode php-mode powerline swiper use-package)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(powerline-height nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(solarized-bold nil)
 '(solarized-distinct-fringe-background nil)
 '(solarized-height-minus-1 0.8)
 '(solarized-high-contrast-mode-line nil)
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

(set-face-attribute 'mode-line nil :box nil :underline nil)
(set-face-attribute 'mode-line-inactive nil :box nil :underline nil)

(provide 'init)
;;; .emacs ends here
