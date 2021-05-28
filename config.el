;; User
(setq user-full-name "Paulo Elienay"
      user-mail-address "elie9alb@gmail.com")

;; Interface
(setq doom-font (font-spec :family "Inconsolata" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-theme 'doom-challenger-deep)
(setq display-line-numbers-type t)
(setq-default mode-line-format nil)

;; org-mode
(setq org-directory "~/org/")

(load! "keybindings.el")
(load! "defuns.el")
