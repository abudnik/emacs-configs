;;(load-file "/home/Andrew/dev/cedet-bzr/trunk/cedet-devel-load.el")
(load-file "/home/Andrew/dev/global-6.2.6/gtags.el")

(setq inhibit-splash-screen t)

(add-to-list 'load-path "/home/Andrew/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/Andrew/.emacs.d/ac-dict")
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
(gtags-mode 1)

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
 '(ede-project-directories (quote ("/home/Andrew/PythonServer" "/home/Andrew/Project"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(c-add-style "abudnik"
			  '("Ellemtel"
			   (c-basic-offset . 4)		; Guessed value
			   (c-offsets-alist
				(access-label . 0)		; Guessed value
				(arglist-intro . +)		; Guessed value
				(block-close . 0)		; Guessed value
				(catch-clause . 0)		; Guessed value
				(class-close . 0)		; Guessed value
				(class-open . 0)		; Guessed value
				(defun-block-intro . +)	; Guessed value
				(defun-close . 0)		; Guessed value
				(defun-open . 0)		; Guessed value
				(else-clause . 0)		; Guessed value
				(inclass . +)			; Guessed value
				(inline-close . 0)		; Guessed value
				(innamespace . 0)		; Guessed value
				(member-init-cont . -1)	; Guessed value
				(member-init-intro . 0)	; Guessed value
				(namespace-close . 0)	; Guessed value
				(statement . 0)			; Guessed value
				(statement-block-intro . +) ; Guessed value
				(statement-cont . +)	; Guessed value
				(substatement . +)		; Guessed value
				(substatement-open . 0)	; Guessed value
				(topmost-intro . +)		; Guessed value
				(topmost-intro-cont . 0) ; Guessed value
				(annotation-top-cont . 0)
				(annotation-var-cont . +)
				(arglist-close . c-lineup-close-paren)
				(arglist-cont c-lineup-gcc-asm-reg 0)
				(arglist-cont-nonempty . c-lineup-arglist)
				(block-open . 0)
				(brace-entry-open . 0)
				(brace-list-close . 0)
				(brace-list-entry . 0)
				(brace-list-intro . +)
				(brace-list-open . 0)
				(c . c-lineup-C-comments)
				(case-label . 0)
				(comment-intro . c-lineup-comment)
				(composition-close . 0)
				(composition-open . 0)
				(cpp-define-intro c-lineup-cpp-define +)
				(cpp-macro . -1000)
				(cpp-macro-cont . +)
				(do-while-closure . 0)
				(extern-lang-close . 0)
				(extern-lang-open . 0)
				(friend . 0)
				(func-decl-cont . +)
				(incomposition . +)
				(inexpr-class . +)
				(inexpr-statement . +)
				(inextern-lang . +)
				(inher-cont . c-lineup-multi-inher)
				(inher-intro . +)
				(inlambda . c-lineup-inexpr-block)
				(inline-open . +)
				(inmodule . +)
				(knr-argdecl . 0)
				(knr-argdecl-intro . +)
				(label . 2)
				(lambda-intro-cont . +)
				(module-close . 0)
				(module-open . 0)
				(namespace-open . 0)
				(objc-method-args-cont . c-lineup-ObjC-method-args)
				(objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
				(objc-method-intro .
								   [0])
				(statement-case-intro . +)
				(statement-case-open . 0)
				(stream-op . c-lineup-streamop)
				(string . -1000)
				(substatement-label . 2)
				(template-args-cont c-lineup-template-args +))))

;;Ellemtel
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "abudnik")))
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "abudnik")))
