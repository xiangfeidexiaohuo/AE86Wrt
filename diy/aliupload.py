#!/use/bin/env python 3.10.0
# Copyright © 2022 yanbuyu's Project

import os, sys, argparse
from aligo import Aligo

supportSuffixs = ['.zip', '.gz', '.trx', '.img']##自定义支持上传的文件的后缀

def getFileList(filePath):
    filePath = os.path.abspath(filePath)##获取绝对路径
    fileList = []
    if os.path.isdir(filePath):
        for root, dirs, files in os.walk(filePath):
            for file in files:
                if os.path.splitext(file)[-1] in supportSuffixs: fileList.append(os.path.join(root, file))
    elif os.path.isfile(filePath):
        fileList.append(filePath)
    else:
        print('错误，请输入文件夹或文件路径')
        return(fileList)
        sys.exit(1)
    return(fileList)

def uploadFilesToAliCloud(token, uploadFloder, fileList):
    if token:
        ali = Aligo(refresh_token=token)
    else:
        ali = Aligo()
    folder = ali.get_folder_by_path(uploadFloder)##上传路径
    ##自动上传
    for filePath in fileList:
        fileName = os.path.basename(filePath)
        up_file = ali.upload_file(filePath, folder.file_id, fileName)
        if up_file:
            print(f'[{fileName}]上传成功')
        else:
            print(f'[{fileName}]上传失败')

def main(token, uploadFloder, filePath):
    uploadFilesToAliCloud(token, uploadFloder, getFileList(filePath))


if __name__ == "__main__":
    supportSuffixFile = ' '.join(supportSuffixs)
    parser = argparse.ArgumentParser(description = r'一键上传文件至阿里云盘，需要配置token或扫码登录，获取token教程：https://github.com/foyoux/aligo/wiki/%E7%99%BB%E5%BD%95')
    #type是要传入的参数的数据类型  help是该参数的提示信息
    parser.add_argument('--token', '-t', type = str, required = False, default = None, help = '若token缺省，用户首次使用此脚本则需要扫码登录')
    parser.add_argument('--uploadFloder', '-u', type = str, required = True, help = '上传文件的云端目录')
    parser.add_argument('--file', '-f', type = str, required = True, help = f'需要上传的文件或目录（若此参数为目录，则只上传以{supportSuffixFile}为后缀的文件')

    args = parser.parse_args()
    main(args.token, args.uploadFloder, args.file)
