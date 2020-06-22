;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; It works because of black magic
(package-initialize t)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;;epitech header
(load! "epitech-conf/std.el")
(load! "epitech-conf/std_comment.el")

(setq-default show-trailing-whitespace t)
;;company conf
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  )

(use-package company-irony
  :ensure t
  :config
  (eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
  )

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(with-eval-after-load 'company
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

;; mc conf
(use-package multiple-cursors
  :ensure t
  :bind (("M-." . mc/mark-next-like-this)
         ("M-," . mc/unmark-next-like-this)
         ("<C-S-mouse-1>" . mc/add-cursor-on-click))) ;;C-S-<left> => new cursor


;;usefull shortcut to go switch .h / .c .c++ files back and forth
(global-set-key (kbd "<backtab>") 'ff-find-other-file)

;;centaur tabs config
(use-package centaur-tabs
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-enable-buffer-reordering)
  (setq centaur-tabs-adjust-buffer-order t)
  (setq centaur-tabs-style "bar")
  (centaur-tabs-headline-match)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-close-button "X")
  (setq centaur-tabs-set-modified-marker t)
  (centaur-tabs-group-by-projectile-project))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
