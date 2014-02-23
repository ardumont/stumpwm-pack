(setq *TEMPORARY-PACKAGE-ARCHIVES* package-archives)

(install-packs '(stumpwm-mode)
               (add-to-list '*TEMPORARY-PACKAGE-ARCHIVES* '("melpa" . "http://melpa.milkbox.net/packages/") t))

(require 'stumpwm-mode)
(require 'rainbow-delimiters)

(add-to-list 'auto-mode-alist '("\\.stumpwmrc$" . stumpwm-mode))

(setq stumpwm-mode-hook)
(add-hook 'stumpwm-mode-hook (lambda ()
                               (setq major-mode 'lisp-mode)
                               (lisp-mode-variables)
                               (paredit-mode 1)
                               (rainbow-delimiters-mode 1)
                               (eldoc-mode 1)))

;; Load bindings config
(live-load-config-file "bindings.el")
