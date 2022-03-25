;;; Bindings

;; Base (Sane)
(global-set-key (kbd "M-w") 'counsel-M-x)

;; Editing
(global-set-key (kbd "M-n") 'evil-open-below)
(global-set-key (kbd "M-v") '+evil/alt-paste)

;; Motion
(global-set-key (kbd "M-j") 'evil-avy-goto-word-1)
(global-set-key (kbd "C-s") 'swiper-helm)

;; Doom Update
(map!
 :map doom-sync-map
 :leader
 :desc "Doom Update"
 :m "q u" 'doom-sync)
