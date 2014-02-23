(live-add-pack-lib "stumpwm-mode.el")

(require 'stumpwm-mode)

(add-to-list 'auto-mode-alist '("\\.stumpwmrc$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.stumpwmrc$" . stumpwm-mode))

;; Load bindings config
(live-load-config-file "bindings.el")
