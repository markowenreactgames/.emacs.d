(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

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

(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-status-buffer-switch-function 'switch-to-buffer)

(eshell)
