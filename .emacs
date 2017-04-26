;;; emacs24 configuration file

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" default)))
 '(inhibit-startup-screen t)
 '(init-loader-show-log-after-init (quote error-only))
 '(line-number-mode nil)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil :family "Roboto Mono Medium for Powerline" :foundry "pyrs" :slant normal :weight normal :height 113 :width normal)))))

;; load init.el
(load "~/.emacs.d/init.el")
