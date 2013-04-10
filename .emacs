(setq inhibit-splash-screen t)
(tool-bar-mode 0)
(load-theme 'tango-dark)
(fset 'yes-or-no-p 'y-or-n-p)

; set fullscreen
(defun fullscreen (&optional f)
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(fullscreen)

(add-to-list 'load-path "~/.emacs.d/")
(load "auto-complete.el")
(load "auto-complete-config.el")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;(desktop-save-mode 1)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

(global-ede-mode 1)
;;(ede-enable-generic-projects)

(semantic-mode 1)
(global-semantic-idle-completions-mode)
(global-semantic-idle-scheduler-mode)
(global-semantic-stickyfunc-mode)
;; (global-semantic-decoration-mode)
(global-semantic-highlight-func-mode)
(global-semantic-highlight-edits-mode)
(global-semantic-mru-bookmark-mode)

;;(require 'semantic/ia)
;;(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
;;(require 'semantic/bovine/clang)

(add-to-list 'ac-sources 'ac-source-semantic)
(add-to-list 'ac-sources 'ac-source-gtags)

;;(semanticdb-enable-gnu-global-databases 'c-mode t)
;;(semanticdb-enable-gnu-global-databases 'c++-mode t)

;;(when (cedet-ectag-version-check t)
;;  (require 'semantic/ectags/db)
;;  (semantic-load-enable-primary-ectags-support))

;;(global-semanticdb-minor-mode 1)

(auto-fill-mode 1)
;;(gtags-mode 1)

(add-to-list 'auto-mode-alist '("\\.ipp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(semantic-add-system-include "/usr/include/boost" 'c++-mode)
;;(add-to-list 'semantic-c-add-preprocessor-symbol "/usr/include/boost/config.hpp")
(semantic-add-system-include "/usr/include/c++/4.7.2" 'c++-mode)
;;(add-to-list 'semantic-c-add-preprocessor-symbol "/usr/include/c++/4.7.2/string")

;;(ede-cpp-root-project "Project"
;;  :name "Project"
;;  :file "Project/PythonServer.cpp"
;;  :system-include-path '("/usr/include/c++/4.7.2"
;;						 "/usr/include/boost")
;;)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories (quote ("~/PythonServer" "~/Project/src"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




(c-add-style "abudnik"
			  '("Ellemtel"
			   (c-basic-offset . 4)
			   (c-hanging-braces-alist . ((substatement-open before after)
										  (arglist-cont-nonempty)))
			   (c-offsets-alist
				(topmost-intro . 0)
				(substatement . +)
				(substatement-open . 0)
				(case-label . +)
				(access-label . -)
				(inclass . +)
				(inline-open . 0)
				(innamespace . 0)
				(member-init-cont . -1)
				(member-init-intro . 0)
				(friend . -)
				)))

;;Ellemtel
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "abudnik")
		 	 ;; rebind key mappings
             (local-set-key (kbd "M-w") 'kill-region)
			 (local-set-key (kbd "C-w") 'kill-ring-save)
		   )

)
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "abudnik")
			 ;; rebind key mappings
             (local-set-key (kbd "M-w") 'kill-region)
			 (local-set-key (kbd "C-w") 'kill-ring-save)
		  )
)
