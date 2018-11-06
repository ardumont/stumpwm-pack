;;; stumpwm-pack.el --- Stumpwm

;;; Commentary:

;;; Code:

(require 'smartscan)
(require 'rainbow-delimiters)

(defun stumpwm-pack-eval-buffer ()
  "Eval the current buffer."
  (interactive)
  (stumpwm-eval-region (point-min) (point-max)))

(require 'stumpwm-mode)
(add-to-list 'auto-mode-alist '("\\.stumpwmrc$" . stumpwm-mode))
(add-hook 'stumpwm-mode-hook
	  (lambda ()
	    (setq major-mode 'lisp-mode)
	    (lisp-mode-variables t t)
	    (paredit-mode 1)
	    (rainbow-delimiters-mode 1)
	    (eldoc-mode 1)
	    (smartscan-mode)))

(define-key stumpwm-mode-map (kbd "C-c m r") 'stumpwm-eval-region)
(define-key stumpwm-mode-map (kbd "C-c m b") 'stumpwm-pack-eval-buffer)

(provide 'stumpwm-pack)
;;; stumpwm-pack.el ends here
