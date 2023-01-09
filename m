Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9384663101
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Jan 2023 21:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF8910E486;
	Mon,  9 Jan 2023 20:10:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11110E08B;
 Mon,  9 Jan 2023 20:10:49 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309I2Gbh015694; Mon, 9 Jan 2023 20:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=jUANk1sUBjvkcXo4F7E4VJUiJF91U0hygswuYCgVs9o=;
 b=sjKuOj87quOPL4x97JCGT0n6j4OvaKo9JgreUK02MoRAF4ooP8XDOXxMSsOU4j1aBLge
 H/JeaMEy9Jufyw59x6j1vtNdHmprb3dR1f2iy1dE588DAp1czBd5WWFebNm48YAt1VQh
 +4sGzPZrhi9tkl6QBJ3z/+D6I+Wcu7X+0AsSH5St09nihBdjwC/08+5OyKoEa7PyryX4
 KWTqu/FfuVI1k/7546M3PKoYlxUEsKOEvPZQJUCstUTWOGA6AC1aPyl1J4AQmNC4Rl97
 vt/tWyy3Lq4C17Qz/laPsT1QXR5n0ooiz/WMJF550w7/OzUScdg/TwFPZYMfAp9n4jfT GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp27s2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 20:10:44 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309K7u9K003676;
 Mon, 9 Jan 2023 20:10:44 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp27s1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 20:10:44 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309JF8Ep021950;
 Mon, 9 Jan 2023 20:10:42 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3my0c7s311-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 20:10:42 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309KAfb624773194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 20:10:41 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC6575803F;
 Mon,  9 Jan 2023 20:10:40 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A465D5804E;
 Mon,  9 Jan 2023 20:10:38 +0000 (GMT)
Received: from li-2311da4c-2e09-11b2-a85c-c003041e9174.ibm.com.com (unknown
 [9.65.251.44]) by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 20:10:38 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: alex.williamson@redhat.com, pbonzini@redhat.com
Subject: [PATCH 0/2] kvm/vfio: fix potential deadlock on vfio group lock
Date: Mon,  9 Jan 2023 15:10:35 -0500
Message-Id: <20230109201037.33051-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HM6h6j1tRZm-o5imo2ah2XQ9Uc1zdcw7
X-Proofpoint-GUID: Lr2MBWKHuVuEHQcxXlJ8qPbazXOLOLZN
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_13,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090141
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 imbrenda@linux.ibm.com, frankja@linux.ibm.com, pmorel@linux.ibm.com,
 david@redhat.com, linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 pasic@linux.ibm.com, jgg@nvidia.com, kvm@vger.kernel.org,
 borntraeger@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Alex, Paolo,

As reported by Alex [1], since commit 421cfe6596f6 it is possible for
a kvm_put_kvm call to hit a refcount of 0 and trigger kvm_destroy_vm
while the vfio group lock is held.  However, if this occurs, and the
associated group is still in the kvm device list, this thread of
execution will attempt to acquire the vfio group lock again, resulting
in a deadlock.

This series proposes to resolve this by adding a new kvm_put_kvm_async
which behaves the same as kvm_put_kvm but, in the case where the refcount
hits 0, will use a workqueue to perform the kvm_destroy_vm asynchronously.

The fix is provided in 2 patches because s390 PCI passthrough has the same
issue, albeit introduced slightly later via a different commit.

[1]: https://lore.kernel.org/kvm/20230105150930.6ee65182.alex.williamson@redhat.com/

Matthew Rosato (2):
  KVM: async kvm_destroy_vm for vfio devices
  KVM: s390: pci: use asyncronous kvm put

 arch/s390/kvm/pci.c               |  8 ++++++--
 drivers/gpu/drm/i915/gvt/kvmgt.c  |  6 +++++-
 drivers/s390/crypto/vfio_ap_ops.c |  7 ++++++-
 include/linux/kvm_host.h          |  3 +++
 virt/kvm/kvm_main.c               | 22 ++++++++++++++++++++++
 5 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.39.0

