module github.com/skydive-project/skydive-plugins

require (
	github.com/mailru/easyjson v0.7.0
	github.com/shirou/gopsutil v0.0.0-20180111024713-6a368fb7cd12
	github.com/skydive-project/skydive v0.0.0-20191009170754-872a2c0bfd34
	github.com/spf13/viper v1.4.0
)

replace (
	github.com/skydive-project/skydive => /home/safchain/code/gocode/src/github.com/skydive-project/skydive
	github.com/spf13/viper v1.4.0 => github.com/lebauce/viper v0.0.0-20190903114911-3b7a98e30843
	golang.org/x/sys => golang.org/x/sys v0.0.0-20190412213103-97732733099d
	golang.org/x/tools => golang.org/x/tools v0.0.0-20190925230517-ea99b82c7b93
)
