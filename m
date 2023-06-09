Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F372A1D6
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Jun 2023 20:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3FD10E16A;
	Fri,  9 Jun 2023 18:12:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 5051 seconds by postgrey-1.36 at gabe;
 Fri, 09 Jun 2023 18:11:59 UTC
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC8F10E00A;
 Fri,  9 Jun 2023 18:11:59 +0000 (UTC)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359GhFSl008705; Fri, 9 Jun 2023 16:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lZbdk4xyFKSpLnTzVbMkGLvASS//Im1J101xKTmXJ6A=;
 b=Rh/Fbpl52BobgLZnOm/GhJFdhtl0sMETGy1sHPSBL9ZA9v8X7BaY0Nq5Iwuhmgi66xFT
 8Jpa9tep0hd+fmkBH192lLugpuoQEcw7y3nWhdu+Irm3CVMnOdFaGpEM6HT09DnK0KXA
 i4+P+nWDBi+8b3d9WotAyxy2C65zaidTy+tfkLEjA4yUUUcD7fxEyuDo4V+i9KrkTmlM
 26PIcCMNX0mqsx+HHLUKEXPsscqvSRosOC31yWyb1G1dLcGEpCWj6V4J81N39mJVS+4O
 m/qZd5nHl9Ru7KayX8bv4r6NW9mmTZfbXe7nKMGLv/XddKwHJY05C5xwCjUklJgDwO8A kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r47jc0e85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 16:47:26 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 359GhQw4009260;
 Fri, 9 Jun 2023 16:47:26 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r47jc0e6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 16:47:26 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 359EPMgx004580;
 Fri, 9 Jun 2023 16:47:25 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3r2a74ekm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 16:47:24 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 359GlNLN65339710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Jun 2023 16:47:24 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D303458055;
 Fri,  9 Jun 2023 16:47:23 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B91F5804B;
 Fri,  9 Jun 2023 16:47:21 +0000 (GMT)
Received: from [9.61.27.227] (unknown [9.61.27.227])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  9 Jun 2023 16:47:20 +0000 (GMT)
Message-ID: <7c6b0eef-4413-56c1-22d1-bbd51ff51cd0@linux.ibm.com>
Date: Fri, 9 Jun 2023 12:47:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 00/24] Add vfio_device cdev for iommufd support
Content-Language: en-US
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230602121653.80017-1-yi.l.liu@intel.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20230602121653.80017-1-yi.l.liu@intel.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eIFuRLKC-g7TXHBFbUqvlbSOksUSiWkh
X-Proofpoint-GUID: WXA4XS928uuiv_e705QuA6zw3biN1B2H
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_12,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090140
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
Cc: kvm@vger.kernel.org, jasowang@redhat.com, xudong.hao@intel.com,
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, lulu@redhat.com, zhenzhong.duan@intel.com,
 joro@8bytes.org, nicolinc@nvidia.com, yan.y.zhao@intel.com,
 intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 clegoate@redhat.com, cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, yanting.jiang@intel.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 6/2/23 8:16 AM, Yi Liu wrote:
> Existing VFIO provides group-centric user APIs for userspace. Userspace
> opens the /dev/vfio/$group_id first before getting device fd and hence
> getting access to device. This is not the desired model for iommufd. Per
> the conclusion of community discussion[1], iommufd provides device-centric
> kAPIs and requires its consumer (like VFIO) to be device-centric user
> APIs. Such user APIs are used to associate device with iommufd and also
> the I/O address spaces managed by the iommufd.
> 
> This series first introduces a per device file structure to be prepared
> for further enhancement and refactors the kvm-vfio code to be prepared
> for accepting device file from userspace. After this, adds a mechanism for
> blocking device access before iommufd bind. Then refactors the vfio to be
> able to handle cdev path (e.g. iommufd binding, no-iommufd, [de]attach ioas).
> This refactor includes making the device_open exclusive between the group
> and the cdev path, only allow single device open in cdev path; vfio-iommufd
> code is also refactored to support cdev. e.g. split the vfio_iommufd_bind()
> into two steps. Eventually, adds the cdev support for vfio device and the
> new ioctls, then makes group infrastructure optional as it is not needed
> when vfio device cdev is compiled.
> 
> This series is based on some preparation works done to vfio emulated devices[2]
> and vfio pci hot reset enhancements[3].
> 
> This series is a prerequisite for iommu nesting for vfio device[4] [5].
> 
> The complete code can be found in below branch, simple tests done to the
> legacy group path and the cdev path. Draft QEMU branch can be found at[6]
> However, the noiommu mode test is only done with some hacks in kernel and
> qemu to check if qemu can boot with noiommu devices.
> 
> https://github.com/yiliu1765/iommufd/tree/vfio_device_cdev_v12
> (config CONFIG_IOMMUFD=y CONFIG_VFIO_DEVICE_CDEV=y)
> 
> base-commit: 0948fa29d62eca627a19d5b1534262a6d93d4181
> 

Hi Yi,

I gave a tested-by some time ago, and have been running with various versions in between -- but there have been enough changes that by now the testing seems worth reaffirming.

So, on this version (along with the QEMU test counterpart) I have tested the following on s390:

1) default vfio container testing using vfio-pci, vfio-ap, vfio-ccw
2) iommufd vfio compat testing using vfio-pci, vfio-ap, vfio-ccw (via group)
3) iommufd vfio compat testing using vfio-pci (via cdev)
4) iommufd + s390 nesting WIP kernel+QEMU series (built on top of intel and SMMUv3 nesting series) using vfio-pci


Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>


Thanks,
Matt


