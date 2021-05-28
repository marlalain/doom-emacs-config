;; User
(setq user-full-name "Paulo Elienay"
      user-mail-address "elie9alb@gmail.com")

;; Interface
(setq doom-font (font-spec :family "Inconsolata" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-theme 'doom-challenger-deep)
(setq mode-line-format nil)
(setq display-line-numbers-type t)

;; org-mode
(setq org-directory "~/org/")

(load! "keybindings.el")
(load! "defuns.el")
;;; Bindings
;; TODO Move me to ./bindings.el !
;; Base (Sane)
(global-set-key (kbd "M-w") 'counsel-M-x)

;; Editing
(global-set-key (kbd "M-n") 'evil-open-below)

;; Motion
(global-set-key (kbd "M-j") 'evil-avy-goto-word-1)
(global-set-key (kbd "C-s") 'swiper-helm)
