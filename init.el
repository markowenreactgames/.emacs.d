(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(defvar my-packages '(better-defaults
		      paredit
		      idle-highlight-mode
		      ido-ubiquitous
		      find-file-in-project
		      magit
		      smex
		      scpaste
                      railscasts-theme))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load-theme 'railscasts t nil)

(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

(setq inhibit-startup-message t)
(setq magit-status-buffer-switch-function 'switch-to-buffer)
(defalias 'yes-or-no-p 'y-or-n-p)

(eshell)
