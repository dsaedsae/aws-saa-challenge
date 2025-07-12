#!/bin/bash

# Day 3: EBS & Snapshot 실습 명령어 모음

# --- 1. EC2 인스턴스 내부 작업 ---

# 연결된 블록 디바이스(디스크) 목록 확인
lsblk

# 새로운 EBS 볼륨(/dev/xvdf)을 ext4 파일 시스템으로 포맷
sudo mkfs -t ext4 /dev/xvdf

# 볼륨을 마운트할 /data 디렉토리 생성
sudo mkdir /data

# /dev/xvdf 디스크를 /data 디렉토리에 마운트
sudo mount /dev/xvdf /data

# 마운트 확인을 위한 테스트 파일 생성
sudo touch /data/test.txt
ls /data


# --- 2. CLI를 이용한 검증 및 정리 ---

# 현재 계정의 EBS 볼륨 목록 확인
aws ec2 describe-volumes

# 내가 소유한 스냅샷 목록 확인
aws ec2 describe-snapshots --owner-ids self

# 리소스 정리 (ID는 실제 값으로 대체 필요)
# aws ec2 terminate-instances --instance-ids [인스턴스_ID]
# aws ec2 delete-volume --volume-id [원본_볼륨_ID]
# aws ec2 delete-volume --volume-id [복원된_볼륨_ID]
# aws ec2 delete-snapshot --snapshot-id [스냅샷_ID]