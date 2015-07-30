;;; stumpwm-pack.el --- Stumpwm

;;; Commentary:

;;; Code:

(use-package smartscan)
(use-package rainbow-delimiters)

(defun stumpwm-pack-eval-buffer ()
  "Eval the current buffer."
  (interactive)
  (stumpwm-eval-region (point-min) (point-max)))

(use-package stumpwm-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.stumpwmrc$" . stumpwm-mode))
  (add-hook 'stumpwm-mode-hook
            (lambda ()
              (setq major-mode 'lisp-mode)
              (lisp-mode-variables t t)
              (paredit-mode 1)
              (rainbow-delimiters-mode 1)
              (eldoc-mode 1)
              (smartscan-mode)))
  :bind (("C-c m r" . stumpwm-eval-region)
         ("C-c m b" . stumpwm-pack-eval-buffer)))


(provide 'stumpwm-pack)
;;; stumpwm-pack.el ends here
