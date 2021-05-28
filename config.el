(setq user-full-name "Paulo Elienay"
      user-mail-address "elie9alb@gmail.com")

(setq doom-font (font-spec :family "Inconsolata" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-theme 'doom-challenger-deep)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(global-set-key (kbd "M-w") 'counsel-M-x)
(global-set-key (kbd "M-n") 'evil-open-below)
(global-set-key (kbd "M-j") 'evil-avy-goto-word-1)
