Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3EB68A4E3
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Feb 2023 22:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7DB898F0;
	Fri,  3 Feb 2023 21:50:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0428E10E900;
 Fri,  3 Feb 2023 21:50:37 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313KCvTA014601; Fri, 3 Feb 2023 21:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8fF0xaPyJ2fnhwpEn/FBipTGJpdhy6LRkoj5J9EiAMI=;
 b=Sv0YD25QmlZYo4KfhMcq+Ob2S+u2lLSJOvaPr5TjhS7mUly/UEDnX96rf8HioDPI8brG
 gjGDF+LJD6nuj5HZTBGjQAnO0w4IZBfj11WO1Ns0URdLYEXkF36WiOU1jY42+zaLOgUf
 xdEU+ZIJo6fZK4UacsJVluqfJ64IVCBJYn3yHbTM+zeTz5x8Pbsg21POS1bWHvj516aC
 sBuHo09SXhF847Ij3TIResFrB5ec9gS+Zj2rm2+MsyBqJ0qf1kRe4tn2IaZAfCmd8wJD
 RJGvaSBl2SXryHl7j25JNGHBstTfHri8sBRF4f1lgGJfuA3gOvEa0mSs5gosjWiNAsae gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh7by5epu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 21:50:33 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 313L03Fa029159;
 Fri, 3 Feb 2023 21:50:33 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh7by5ep4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 21:50:33 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 313Jdwg8004994;
 Fri, 3 Feb 2023 21:50:32 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3ncvv2awkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 21:50:32 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 313LoUD955181696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Feb 2023 21:50:30 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AE6358056;
 Fri,  3 Feb 2023 21:50:30 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4970F58052;
 Fri,  3 Feb 2023 21:50:28 +0000 (GMT)
Received: from li-2311da4c-2e09-11b2-a85c-c003041e9174.ibm.com.com (unknown
 [9.65.253.123]) by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  3 Feb 2023 21:50:28 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: alex.williamson@redhat.com, pbonzini@redhat.com, yi.l.liu@intel.com,
 jgg@nvidia.com
Subject: [PATCH v4 0/2] vfio: fix deadlock between group lock and kvm lock
Date: Fri,  3 Feb 2023 16:50:25 -0500
Message-Id: <20230203215027.151988-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: shi6oCLfkYNv_DFuG_4tvhjWbdhwSeNU
X-Proofpoint-ORIG-GUID: Y7mSx3eIJ5Cy6ujhPs_isxzQcRS10p_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=398
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030194
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
 borntraeger@linux.ibm.com, frankja@linux.ibm.com, pmorel@linux.ibm.com,
 david@redhat.com, seanjc@google.com, intel-gfx@lists.freedesktop.org,
 cohuck@redhat.com, kevin.tian@intel.com, zhenyuw@linux.intel.com,
 linux-kernel@vger.kernel.org, pasic@linux.ibm.com, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, imbrenda@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Alex,

Here is the latest group_lock vs kvm lock deadlock fix + a non-fix
follow-on to remove the kvm argument from vfio_device_open and
vfio_device_first_open.

Changes from v3:
* Remove device->group->kvm reference in vfio_main by passing the
  kvm in (Kevin)
* Slight re-organization to make it easier for cdev to build upon
  this later and keep symmetry between get/put (Alex)
* Add follow-on patch that removes unused kvm argument (Yi)

Changes from v2:
* Relocate the new functions back to vfio_main and externalize to call
  from group (Kevin) since cdev will need this too
* s/vfio_kvm_*_kvm/vfio_device_*_kvm/ and only pass device as input.
  Handle new kvm_ref_lock directly inside vfio_device_get_kvm (Alex)
* Add assert_lockdep_held for dev_set lock (Alex)
* Internalize error paths for vfio_device_get_kvm_safe and now return
  void - either device->kvm is set with a ref taken or is NULL (Alex)
* Other flow suggestions to make the call path cleaner - Thanks! (Alex)
* Can't pass group->kvm to vfio_device_open, as it references the value
  outside of new lock.  Pass device->kvm to minimize changes in this
  fix (Alex, Yi)

Changes from v1:
* use spin_lock instead of spin_lock_irqsave (Jason)
* clear device->kvm_put as part of vfio_kvm_put_kvm (Yi)
* Re-arrange code to avoid referencing the group contents from within
  vfio_main (Kevin) which meant moving most of the code in this patch 
  to group.c along with getting/dropping of the dev_set lock

Matthew Rosato (2):
  vfio: fix deadlock between group lock and kvm lock
  vfio: no need to pass kvm pointer during device open

 drivers/vfio/group.c     | 44 +++++++++++++++++++++----
 drivers/vfio/vfio.h      | 18 +++++++++--
 drivers/vfio/vfio_main.c | 70 +++++++++++++++++++++++++++++++++-------
 include/linux/vfio.h     |  2 +-
 4 files changed, 113 insertions(+), 21 deletions(-)

-- 
2.39.1

