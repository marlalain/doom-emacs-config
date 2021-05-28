(defun check-os ()
  "Returns the OS name"
  (eval-when-compile (require 'subr-x))
  (string-trim (shell-command-to-string "uname -n")))
(defun get-privilege-escalation ()
  (set 'esc "")
  (eval-when-compile (require 'subr-x))
  ;; (set 'sudo (string-match "sudo" (shell-command-to-string "command -v sudo")))
  (set 'doas (string-match "doas" (shell-command-to-string "command -v doas")))
  (if (equal nil doas) "doas" "sudo"))
(defun os-install-package (package)
  "Installs package on OS"
  (or (equal (check-os) "NomadBSD") (equal (check-os) "FreeBSD")
      (shell-command-to-string
       (format "%s pkg install %s" (get-privilege-escalation) package))))

(defun doom-sync ()
  "Updates Doom"
  (interactive)
  (message "Updating doom...")
  (async-shell-command "~/.emacs.d/bin/doom sync"))
