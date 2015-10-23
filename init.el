(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages")
                         ("melpa" . "https://melpa.milkbox.net/packages/")))

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

(require 'magit)

(load-theme 'railscasts t nil)
(setq inhibit-startup-message t)
(set-face-attribute 'default nil :height 120)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-status-buffer-switch-function 'switch-to-buffer)

(eshell)
