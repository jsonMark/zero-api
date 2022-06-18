package tool

import (
	"io/ioutil"
)

// GetFilePathByDir
// 递归读取目录下的文件路径
func GetFilePathByDir(dirpath string, fileList *[]string, prepath string) error {
	fd, err := ioutil.ReadDir(dirpath)
	if err != nil {
		return err
	}

	for _, f := range fd {
		if f.IsDir() {
			err = GetFilePathByDir(dirpath+"/"+f.Name()+"/", fileList, prepath+"/"+f.Name())
			if err != nil {
				return err
			}
		} else {
			*fileList = append(*fileList, prepath+"/"+f.Name())
		}
	}
	return nil
}

// 读取文件内容
func ReadData(file string) (string, error) {
	b, err := ioutil.ReadFile(file)
	if err != nil {
		return "", err
	}
	return string(b), nil
}
