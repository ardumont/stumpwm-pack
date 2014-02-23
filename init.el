(setq *TEMPORARY-PACKAGE-ARCHIVES* package-archives)

(install-packs '(stumpwm-mode)
               (add-to-list '*TEMPORARY-PACKAGE-ARCHIVES* '("melpa" . "http://melpa.milkbox.net/packages/") t))

(require 'stumpwm-mode)

(add-to-list 'auto-mode-alist '("\\.stumpwmrc$" . stumpwm-mode))

;; Load bindings config
(live-load-config-file "bindings.el")
