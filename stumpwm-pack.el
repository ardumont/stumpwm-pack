;;; stumpwm-pack.el --- Stumpwm

;; Copyright (C) 2014-2018  Antoine R. Dumont (@ardumont)
;; Author: Antoine R. Dumont (@ardumont) <antoine.romain.dumont@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
