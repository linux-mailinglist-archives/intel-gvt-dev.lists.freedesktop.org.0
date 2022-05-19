Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126752DCDE
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 19 May 2022 20:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F0310E0A8;
	Thu, 19 May 2022 18:33:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AE010E09B;
 Thu, 19 May 2022 18:33:28 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JGFltO014988;
 Thu, 19 May 2022 18:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=FzmMrJydP7SjW/h1T8aJMfFDr6sSO5l8oKubCo8nHjg=;
 b=nTjolHdvK+LKE/W9U6na7yzXN/+FMKxNLlTqIyVFPcGZhZtsQWIDb2cUy9BmLdAQDyZn
 FzMVh2RF8Io0Y/mZsrmBfHhwpXWshw+QLysSwTzoNaObP/sG6dYXW58QLT+CEn1uKc0F
 MJQXUnT1PG0Wrnh9NxCJ0O8xinY5BALWPaQr2PlEK4KNfjV1vJzVKSOTw8x/hzqd/l8h
 ZFmc4sdkXA6X9XqpoIYp1EIQwccdoYMiu4xeIjwBeEhZtEU+0zaDJS9F1CGSUFcjRHjY
 Eaz3nLVFzELKHWoPX6o/4DAJIuO+jqMxBgHhJIxYuHLusc6AH+KjRchuH72JMSTv2p/w 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5rfjv60p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 18:33:20 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24JIDlXX025526;
 Thu, 19 May 2022 18:33:20 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5rfjv60e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 18:33:20 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24JIWUHY016339;
 Thu, 19 May 2022 18:33:19 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3g3r2fcs4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 18:33:19 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24JIXIu263308282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 18:33:18 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86962112064;
 Thu, 19 May 2022 18:33:18 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1D7F112061;
 Thu, 19 May 2022 18:33:15 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.37.97]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 May 2022 18:33:15 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: jgg@nvidia.com, alex.williamson@redhat.com
Subject: [PATCH v3 0/1] vfio: remove VFIO_GROUP_NOTIFY_SET_KVM
Date: Thu, 19 May 2022 14:33:10 -0400
Message-Id: <20220519183311.582380-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9p4q8YdRssq0xupqY300qb0RYenay28B
X-Proofpoint-GUID: gsf9CrkNesk4CEtlXrNJky73nDARnE4O
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_06,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 mlxlogscore=431 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205190105
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

This is built on top of vfio-next and tested with s390x-pci
(zdev-kvm series) and vfio-ap (GVT changes are compile-tested only)

Changes for v3:
- merge branches under if (device->open_count == 1) (Kevin)
- move device->open_count-- out from group_rwsem (Kevin)
- drop null KVM check (Christoph)
- remove extra kvm_{get,put}_kvm from vfio_ap_ops, it was already getting
  a reference (Jason)
- Add comment about kvm reference in vfio.h (Jason)
- Return -EINVAL if !kvm for vfio-ap (Tony)

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
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 82 ++++++--------------------
 drivers/s390/crypto/vfio_ap_ops.c     | 35 ++---------
 drivers/s390/crypto/vfio_ap_private.h |  3 -
 drivers/vfio/vfio.c                   | 83 ++++++++++-----------------
 include/linux/vfio.h                  |  6 +-
 7 files changed, 57 insertions(+), 159 deletions(-)

-- 
2.27.0

