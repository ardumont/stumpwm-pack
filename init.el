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

(defun stumpwm-pack/eval-buffer () "Eval the current buffer"
  (interactive)
  (stumpwm-eval-region (point-min) (point-max)))

(define-key stumpwm-mode-map (kbd "C-c m r") 'stumpwm-eval-region)
(define-key stumpwm-mode-map (kbd "C-c m b") 'stumpwm-pack/eval-buffer)

;; Load bindings config
(live-load-config-file "bindings.el")
