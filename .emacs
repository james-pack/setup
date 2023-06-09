;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "/usr/share/emacs/site-lisp/clang-format-10/clang-format.el")
(load "~/git/emacs-bazel-mode/bazel.el")
(load "~/git/go-mode.el/go-mode.el")
(load "~/git/py-yapf.el/py-yapf.el")

;;(autoload 'go-mode "bazel-mode" nil t)
;;(autoload 'go-mode "go-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))

(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-to-list 'auto-mode-alist '("BUILD\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("BUILD.bazel\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("WORKSPACE\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("\\.bzl\\'" . bazel-mode))

;; C++ mode seems to give the best syntax highlighting and formatting.
(add-to-list 'auto-mode-alist '("\\.proto\\'" . c++-mode))

;; I never use this keybinding and would prefer to use it for manipulating
;; comments below.
(global-unset-key (kbd "C-/"))

;; 'dwim' stands for 'Do What I Mean'
(global-set-key (kbd "C-/ C-/") 'comment-dwim)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-u") 'uncomment-region)

;; Don't close Emacs due to a typo. I hit "C-x C-c" on accident too often.
(when (display-graphic-p) (global-unset-key (kbd "C-x C-c")))

(global-set-key (kbd "C-c u") 'clang-format-buffer)

(set-variable 'gofmt-command "/usr/local/go/bin/gofmt")
(add-hook 'go-mode-hook
          (lambda () (local-set-key (kbd "C-c u") #'gofmt)))

(add-hook 'python-mode-hook
          (lambda () (local-set-key (kbd "C-c u") #'py-yapf-buffer)))

(add-hook 'bazel-mode-hook
          (lambda () (local-set-key (kbd "C-c u") #'bazel-buildifier)))

(setq column-number-mode t)

(setq ring-bell-function 'ignore)
(put 'upcase-region 'disabled nil)
