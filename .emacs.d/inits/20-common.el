;; flymake
(eval-after-load 'flymake '(require 'flymake-cursor))

;; pyflakes
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)

;; helm
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; YASnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"            ;; personal snippets
	))
(yas-global-mode 1)

;; zencoding (called with C-j in default)
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; flymake-go
;; (eval-after-load "go-mode"
;;  '(require 'flymake-go))

;; go-autocomplete
(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)))

;; gofmt
(add-hook 'before-save-hook #'gofmt-before-save)

;; clang-format
(load "clang-format.el")
(global-set-key  (kbd "<f12>") 'clang-format-region)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (add-hook 'before-save-hook 'clang-format-buffer nil t)))

;; julia
(require 'julia-mode)
(add-hook 'julia-mode-hook 'auto-complete-mode)

;; Python
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(setq py-autopep8-options '("--max-line-length=80"))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

(require 'cython-mode)


;; Rust
(require 'rust-mode)
(add-hook 'rust-mode-hook 'auto-complete-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

;; Haskell
(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'auto-complete-mode)

;; Lua
(require 'lua-mode)
(add-hook 'lua-mode-hook 'auto-complete-mode)
