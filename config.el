;; User
(setq user-full-name "Elienay Albuquerque"
      user-mail-address "paulo.albuquerque@acm.org")

;; Interface
(setq doom-font (font-spec :family "Inconsolata" :size 22 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-theme 'doom-challenger-deep)
(setq mode-line-format nil)
(setq display-line-numbers-type t)

;; org-mode
(setq org-directory "~/org/")

(load! "keybindings.el")
(load! "defuns.el")

;; elixir
(setq lsp-elixir-fetch-deps nil
      lsp-elixir-suggest-specs t
      lsp-elixir-signature-after-complete t
      lsp-elixir-enable-test-lenses t)

;;; credo

(defvar-local my/flycheck-local-cache nil)
(defun my/flycheck-checker-get (fn checker property)
  (or (alist-get property (alist-get checker my/flycheck-local-cache))
      (funcall fn checker property)))
(advice-add 'flycheck-checker-get :around 'my/flycheck-checker-get)
(add-hook 'lsp-managed-mode-hook
          (lambda ()
            (when (derived-mode-p 'elixir-mode)
              (setq my/flycheck-local-cache '((lsp . ((next-checkers . (elixir-credo)))))))
            ))


;;; alchemist
(global-set-key (kbd "M-a") 'alchemist-mode-keymap)

;;; global lsp options
(after! lsp-mode
  :config
  (setq
   lsp-mode t
   lsp-ui-imenu-kind-position 'left
   lsp-ui-doc-enable t
   lsp-ui-doc-header t
   lsp-ui-doc-max-height 40
   lsp-ui-doc-max-width 80
   lsp-ui-doc-show-with-cursor t
   lsp-ui-doc-show-with-mouse t
   lsp-ui-doc-enhanced-markdown t
   lsp-ui-sideline-enable t))

;; Alchemist

(use-package! alchemist
  :hook (elixir-mode . alchemist-mode)
  :config
  (set-lookup-handlers! 'elixir-mode
    :definition #'alchemist-goto-definition-at-point
    :documentation #'alchemist-help-search-at-point)
  (set-eval-handler! 'elixir-mode #'alchemist-eval-region)
  (set-repl-handler! 'elixir-mode #'alchemist-iex-project-run)
  (setq alchemist-mix-env "dev"
        alchemist-mode t
        alchemist-hooks-compile-on-save t
        alchemist-hooks-test-on-save t
        alchemist-key-command-prefix (kbd "M-p"))
  )

;; Credo
                                        ;(after! flycheck (flycheck-credo-setup))
                                        ; (after! lsp-ui
                                        ;  (flycheck-add-next-checker 'lsp-ui 'elixir-credo))
