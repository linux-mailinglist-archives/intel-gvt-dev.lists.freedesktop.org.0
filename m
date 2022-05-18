Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4A752C582
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 May 2022 23:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B903510EA67;
	Wed, 18 May 2022 21:26:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C507910E194;
 Wed, 18 May 2022 21:26:32 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IL37Yc011281;
 Wed, 18 May 2022 21:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=y7+InN4T1AhNfnrU+hjtQbi+AUPcRelZo9Aro4X0ebI=;
 b=Cmwc0+XWsZfiP+nmbI1Lgl131c8TUhy7H7ZNgfPLKnvGxTJBLwAfMeAtHQ37T1tsYO5c
 L0EG6zbdPYiIpS2ShYDHu4F7EjvMC2qYMN6NYpVlHX3KBscJzv6UI/H69fKjJDi+I3IU
 XQvaCp1gljf3OpxiHRW8toPAdSUcR4/n9jbbDFz061PtYk85nxmiM7NFlx3XuGRhAm8V
 fefudY7suiC57SqAIsryNJ0BtjMA7a66g8HqTcMIbs3WMHFWR1XdzwaQDsSPmQmQzS24
 HYfx2Sz4dqfDJ2zVniZTQhii3+ABMakAKQDsG56sz9Zkl/hpe8iuw4/0pd+Q/fPap80H lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g58cgrgap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 21:26:19 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24ILJr2m009229;
 Wed, 18 May 2022 21:26:19 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g58cgrgac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 21:26:19 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IL2rtQ019537;
 Wed, 18 May 2022 21:26:18 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 3g242af9se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 21:26:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24ILQHHC27328794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 21:26:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B5E528060;
 Wed, 18 May 2022 21:26:17 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C359E2805E;
 Wed, 18 May 2022 21:26:13 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.37.97]) by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 21:26:13 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: jgg@nvidia.com, alex.williamson@redhat.com
Subject: [PATCH v2 0/1] vfio: remove VFIO_GROUP_NOTIFY_SET_KVM
Date: Wed, 18 May 2022 17:26:06 -0400
Message-Id: <20220518212607.467538-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QrOItCWy51AZo_qIJ1RCc4LMGLxnuhOY
X-Proofpoint-GUID: C7naun7PRSTlUTRKk_2a_XczLp56l8kd
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=560 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205180121
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com, kvm@vger.kernel.org,
 hch@infradead.org, linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

As discussed in this thread:

https://lore.kernel.org/kvm/20220516172734.GE1343366@nvidia.com/

Let's remove VFIO_GROUP_NOTIFY_SET_KVM and instead assume the association
has already been established prior to device_open.  For the types today
that need a KVM (GVT, vfio-ap) these will fail if a KVM is not found.
Looking ahead, vfio-pci-zdev will optionally want the KVM association
(enable hardware assists) but it will not be a hard requirement (still
want to allow other, non-KVM userspace usage). 

This is built on top of Jason's group locking series:
https://github.com/jgunthorpe/linux/commits/vfio_group_locking

And tested with s390x-pci (zdev-kvm series) and vfio-ap (GVT changes are
compile-tested only)

Changes for v2:
- gvt no longer needs release_work, get rid of it (Christoph)
- a few compile fixes for gvt
- update commit to mention fixes gvt oops (Jason)
- s/down_write/down_read/ in a few spots (Jason)
- avoid kvm build dependency by holding group read lock over device
  open/close and put the onus on the driver to obtain a reference if
  it will actually use the kvm pointer.  Document the requirement,
  use lockdep_assert to ensure lock is held during register_notifer;
  today all callers are from driver open_device.

Matthew Rosato (1):
  vfio: remove VFIO_GROUP_NOTIFY_SET_KVM

 drivers/gpu/drm/i915/gvt/gtt.c        |  4 +-
 drivers/gpu/drm/i915/gvt/gvt.h        |  3 -
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 82 ++++++---------------------
 drivers/s390/crypto/vfio_ap_ops.c     | 38 ++++---------
 drivers/s390/crypto/vfio_ap_private.h |  3 -
 drivers/vfio/vfio.c                   | 75 ++++++++----------------
 include/linux/vfio.h                  |  5 +-
 7 files changed, 56 insertions(+), 154 deletions(-)

-- 
2.27.0

