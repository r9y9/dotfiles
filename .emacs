;;; emacs24 configuration file
;;
;; *Instruction for installing emacs24*
;; :mint
;; sudo apt-get install emacs24
;;
;; :ubuntu 12.04
;; sudo add-apt-repository ppa:cassou/emacs
;; sudo apt-get update
;; sudo apt-get install emacs24

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes (quote ("e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" default)))
 '(inhibit-startup-screen t)
 '(line-number-mode nil)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; load init.el
(load "~/.emacs.d/init.el")
