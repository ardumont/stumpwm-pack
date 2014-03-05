;;; php-pack.el --- Stumpwm

;;; Commentary:

;;; Code:

(install-packs '(stumpwm-mode
                 smartscan))

(require 'stumpwm-mode)
(add-to-list 'auto-mode-alist '("\\.stumpwmrc$" . stumpwm-mode))

(require 'smartscan)
(require 'rainbow-delimiters)

(add-hook 'stumpwm-mode-hook (lambda ()
                               (paredit-mode 1)
                               (rainbow-delimiters-mode 1)
                               (eldoc-mode 1)
                               (smartscan-mode)
                               (lisp-mode)))

(defun stumpwm-pack/eval-buffer () "Eval the current buffer"
  (interactive)
  (stumpwm-eval-region (point-min) (point-max)))

(define-key stumpwm-mode-map (kbd "C-c m r") 'stumpwm-eval-region)
(define-key stumpwm-mode-map (kbd "C-c m b") 'stumpwm-pack/eval-buffer)

;;; stumpwm-pack.el ends here
