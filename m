Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851C53BD20
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 Jun 2022 19:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07E510F04E;
	Thu,  2 Jun 2022 17:20:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988FD10F04E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  2 Jun 2022 17:19:59 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252F2OnL013401;
 Thu, 2 Jun 2022 17:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=wVUcz91zU2dWSxmvcaHK/MfdNroqL+GzE0udUmKEgtw=;
 b=RGR1bBRcbgGt+anT0ODY2bwtLk5y5IG0+tScxj+8+1WE1cY5Ca1PApciydiTdM5/u1wi
 WbbYk37vwjhXNT38AJX7Vd1BpycaI/TpfX6sOMfu/KJE20rGiPQmybMXWWN+napig7SA
 8Ify44tgeE2Fz0OFDpU9wNtLumolNF412BFAzKyPy0NaJukduFYXgppUoSBvxzKsV+m5
 F98fXWcNYCG11s/ENIFjAqJIgYvxXYND0fHF8ao+lp59h/s8ojf/XN4l9B04E6rR6nLY
 eHfx8OWS6FriPrnhg3Vt3IwBmUMJeJEc/a8yevKIgwo9LOZcujsp6L029RRCahKc1mLr Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3geyg6tg8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 17:19:57 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252HJut8012130;
 Thu, 2 Jun 2022 17:19:56 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3geyg6tg8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 17:19:56 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252H6TWE026885;
 Thu, 2 Jun 2022 17:19:54 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3gdnetu075-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 17:19:54 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 252HJpTS42860970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jun 2022 17:19:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0742CAE04D;
 Thu,  2 Jun 2022 17:19:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6778AE045;
 Thu,  2 Jun 2022 17:19:50 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Jun 2022 17:19:50 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id A9056E03B3; Thu,  2 Jun 2022 19:19:50 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH v1 00/18] VFIO ccw/mdev rework
Date: Thu,  2 Jun 2022 19:19:30 +0200
Message-Id: <20220602171948.2790690-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: clz7gQvKpvLNZROzvowvqDsjAHahYLaZ
X-Proofpoint-ORIG-GUID: NXpxunQBlobwS8-FlRnVU-r_sTIsoeQZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_05,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020071
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, linux-s390@vger.kernel.org,
 Eric Farman <farman@linux.ibm.com>, Liu Yi L <yi.l.liu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, kvm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Kirti Wankhede <kwankhede@nvidia.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Last autumn, Jason Gunthorpe proposed some rework of vfio-ccw [1],
to better fit with the new mdev API (thank you!). Part of that
series was pulled for kernel 5.16 [2], but the complexities of
the remaining patches got them hung up behind other work.

This series attempts to dust off and complete that, with the
goal of untangling the lifecycle of a s390 subchannel when
bound to vfio-ccw instead of the usual io_subchannel driver.

Patches 1-8 are inspired by and/or split out from that series,
in order to be consumable on their own (backports, etc.).

Patches 9-12 handle the goal of making the FSM complete,
and synchronizing the subchannel's life with that of the mdev.
(This was the goal of patch 5 of the larger series [3].)

Patches 13-14 are pulled directly from the earlier series.
As these patches hit some other of the consumers of vfio,
those on CC who are unfamiliar with vfio-ccw probably only
care about these. :)

Patches 15-18 links the lifecycle of the vfio_ccw_private struct
with the mdev via a vfio reference. (Patch 17 was also pulled
directly from the earlier series.)

In the end, the subchannel probe/remove callbacks from the css
driver simply register/unregister with vfio-mdev. The communication
with the subchannel is delayed until the mdev routines, which
handles all the vfio-related memory and subchannel enablement.
There's no longer a configuration where the mdev is closed while
the subchannel remains enabled, since that's weird.

@Jason: I carried the S-o-b/r-b tags on patches 13, 14, and 17,
as they were cherry-picked straight from your v3.
If you'd prefer your S-o-b on others, please let me know.

[1] https://lore.kernel.org/r/0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com/
[2] https://lore.kernel.org/r/0-v4-cea4f5bd2c00+b52-ccw_mdev_jgg@nvidia.com/
[3] https://lore.kernel.org/r/5-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com/

Cc: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: Tony Krowiak <akrowiak@linux.ibm.com>
Cc: Jason Herne <jjherne@linux.ibm.com>

Eric Farman (14):
  vfio/ccw: Fix FSM state if mdev probe fails
  vfio/ccw: Ensure mdev->dev is cleared on mdev remove
  vfio/ccw: Do not change FSM state in subchannel event
  vfio/ccw: Remove private->mdev
  vfio/ccw: Pass enum to FSM event jumptable
  vfio/ccw: Flatten MDEV device (un)register
  vfio/ccw: Check that private pointer is not NULL
  vfio/ccw: Create an OPEN FSM Event
  vfio/ccw: Create a CLOSE FSM event
  vfio/ccw: Refactor vfio_ccw_mdev_reset
  vfio/ccw: Move FSM open/close to MDEV open/close
  vfio/ccw: Manage private with mdev
  vfio/ccw: Create a get_private routine
  vfio/ccw: Manage ccw/mdev reference counts

Jason Gunthorpe (3):
  vfio/mdev: Consolidate all the device_api sysfs into the core code
  vfio/mdev: Add mdev available instance checking to the core
  vfio: Export vfio_device_try_get()

Michael Kawano (1):
  vfio/ccw: Remove UUID from s390 debug log

 .../driver-api/vfio-mediated-device.rst       |   8 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |   9 +-
 drivers/s390/cio/vfio_ccw_async.c             |   1 -
 drivers/s390/cio/vfio_ccw_drv.c               | 114 ++++++--------
 drivers/s390/cio/vfio_ccw_fsm.c               |  91 +++++++++--
 drivers/s390/cio/vfio_ccw_ops.c               | 145 ++++++------------
 drivers/s390/cio/vfio_ccw_private.h           |  33 +++-
 drivers/s390/crypto/vfio_ap_ops.c             |  41 ++---
 drivers/s390/crypto/vfio_ap_private.h         |   2 -
 drivers/vfio/mdev/mdev_core.c                 |  13 +-
 drivers/vfio/mdev/mdev_private.h              |   2 +
 drivers/vfio/mdev/mdev_sysfs.c                |  64 +++++++-
 drivers/vfio/vfio.c                           |   3 +-
 include/linux/mdev.h                          |  13 +-
 include/linux/vfio.h                          |   1 +
 samples/vfio-mdev/mbochs.c                    |   9 +-
 samples/vfio-mdev/mdpy.c                      |  31 +---
 samples/vfio-mdev/mtty.c                      |  10 +-
 18 files changed, 300 insertions(+), 290 deletions(-)

-- 
2.32.0

