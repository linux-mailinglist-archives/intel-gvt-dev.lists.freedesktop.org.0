Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A6352EDD3
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 May 2022 16:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D0110E2DC;
	Fri, 20 May 2022 14:10:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC9310E1B5;
 Fri, 20 May 2022 14:10:13 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KCg1X1017179;
 Fri, 20 May 2022 14:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AaXFxRLlAXh0OJXd3i0v0sEmXFeIDLohR3KbBMTlZm0=;
 b=NhorpV3OmoLlNW+izxF0RO/zd3yZ4vwMmEra+MA4i9avikgpMw2Kdr10bu8l0LeduiKY
 4prlVIrQnBpqD/CgDkth7vBQvKBgazYc2aOveQykw+q7Z+ifxjkoCJxqR//csDKALDWj
 lXExzsCzkpjAyDj3rNSf9ZGGDIBstmHDlm52ONpSCeCyENvgtfMrFt7hKl/XfXJeuBaH
 +CP7W4dyqjiM+sher/PsLlSSlApqBxJ+RI5sQwT+BtzGPGGgxMtFqZ+gc6s9Nw/subd7
 uup7EkKFFO+WO8WLCQ12w223GWn4a76XHjR2pMaKrCIx/E+a1OWrvT7ijlvEyMgEMpfM gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6b7ea0ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 14:10:04 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24KCoR7i019873;
 Fri, 20 May 2022 14:10:03 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6b7ea0n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 14:10:03 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24KDqZmC022319;
 Fri, 20 May 2022 14:10:02 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3g242b5vnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 14:10:02 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24KEA0JT26214900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 14:10:00 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0E4E6E059;
 Fri, 20 May 2022 14:10:00 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 218616E054;
 Fri, 20 May 2022 14:09:59 +0000 (GMT)
Received: from [9.211.37.97] (unknown [9.211.37.97])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 14:09:59 +0000 (GMT)
Message-ID: <b85ee6e2-9388-34b4-e1cd-e7e8578a4edf@linux.ibm.com>
Date: Fri, 20 May 2022 10:09:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/1] vfio: remove VFIO_GROUP_NOTIFY_SET_KVM
Content-Language: en-US
To: Tony Krowiak <akrowiak@linux.ibm.com>, jgg@nvidia.com,
 alex.williamson@redhat.com
References: <20220519183311.582380-1-mjrosato@linux.ibm.com>
 <20220519183311.582380-2-mjrosato@linux.ibm.com>
 <8b6db781-9d4e-4d64-04fa-94e45dbf8b22@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <8b6db781-9d4e-4d64-04fa-94e45dbf8b22@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JbVWXzBI665Zek4q7WxxaxIvx3Rxgpnn
X-Proofpoint-ORIG-GUID: lQLv-jWQXKTjsC9RX60nlxiG1SKzDspj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200099
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
Cc: jjherne@linux.ibm.com, hch@infradead.org, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 5/20/22 9:56 AM, Tony Krowiak wrote:
> 
> 
> On 5/19/22 2:33 PM, Matthew Rosato wrote:
>> Rather than relying on a notifier for associating the KVM with
>> the group, let's assume that the association has already been
>> made prior to device_open.  The first time a device is opened
>> associate the group KVM with the device.
>>
>> This fixes a user-triggerable oops in GVT.
>>
>> Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/gtt.c        |  4 +-
>>   drivers/gpu/drm/i915/gvt/gvt.h        |  3 -
>>   drivers/gpu/drm/i915/gvt/kvmgt.c      | 82 ++++++--------------------
>>   drivers/s390/crypto/vfio_ap_ops.c     | 35 ++---------
>>   drivers/s390/crypto/vfio_ap_private.h |  3 -
>>   drivers/vfio/vfio.c                   | 83 ++++++++++-----------------
>>   include/linux/vfio.h                  |  6 +-
>>   7 files changed, 57 insertions(+), 159 deletions(-)
>>
>>
>> diff --git a/drivers/s390/crypto/vfio_ap_ops.c 
>> b/drivers/s390/crypto/vfio_ap_ops.c
>> index e8914024f5b1..a7d2a95796d3 100644
>> --- a/drivers/s390/crypto/vfio_ap_ops.c
>> +++ b/drivers/s390/crypto/vfio_ap_ops.c
>> @@ -1284,25 +1284,6 @@ static void vfio_ap_mdev_unset_kvm(struct 
>> ap_matrix_mdev *matrix_mdev)
>>       }
>>   }
>> -static int vfio_ap_mdev_group_notifier(struct notifier_block *nb,
>> -                       unsigned long action, void *data)
>> -{
>> -    int notify_rc = NOTIFY_OK;
>> -    struct ap_matrix_mdev *matrix_mdev;
>> -
>> -    if (action != VFIO_GROUP_NOTIFY_SET_KVM)
>> -        return NOTIFY_OK;
>> -
>> -    matrix_mdev = container_of(nb, struct ap_matrix_mdev, 
>> group_notifier);
>> -
>> -    if (!data)
>> -        vfio_ap_mdev_unset_kvm(matrix_mdev);
>> -    else if (vfio_ap_mdev_set_kvm(matrix_mdev, data))
>> -        notify_rc = NOTIFY_DONE;
>> -
>> -    return notify_rc;
>> -}
>> -
>>   static struct vfio_ap_queue *vfio_ap_find_queue(int apqn)
>>   {
>>       struct device *dev;
>> @@ -1402,11 +1383,10 @@ static int vfio_ap_mdev_open_device(struct 
>> vfio_device *vdev)
>>       unsigned long events;
>>       int ret;
>> -    matrix_mdev->group_notifier.notifier_call = 
>> vfio_ap_mdev_group_notifier;
>> -    events = VFIO_GROUP_NOTIFY_SET_KVM;
>> +    if (!vdev->kvm)
>> +        return -EINVAL;
>> -    ret = vfio_register_notifier(vdev, VFIO_GROUP_NOTIFY, &events,
>> -                     &matrix_mdev->group_notifier);
>> +    ret = vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
>>       if (ret)
>>           return ret;
> 
> I'm sorry I didn't see this with my last review, but maybe move the call
> to vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm) after the successful
> registration of the IOMMU notifier? This way you won't be plugging AP 
> queues
> into the guest only to remove them if the registration fails.

This is a pretty edge error case, and the 
vfio_ap_mdev_unset_kvm(matrix_mdev) call at err_kvm should do the proper 
cleanup, right?  I guess I'm wondering if it's really any different than 
the prior code which would have registered the VFIO_GROUP_NOTIFY_SET_KVM 
first, which would have immediately triggered the notifier since the KVM 
was already registered to the group, meaning it would haved called 
vfio_ap_mdev_group_notifier->vfio_ap_mdev_set_kvm anyway (see 
vfio_register_group_notifier, the "The attaching of kvm and vfio_group 
might already happen..." comment)

> 
>> @@ -1415,12 +1395,11 @@ static int vfio_ap_mdev_open_device(struct 
>> vfio_device *vdev)
>>       ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY, &events,
>>                        &matrix_mdev->iommu_notifier);
>>       if (ret)
>> -        goto out_unregister_group;
>> +        goto err_kvm;
>>       return 0;
>> -out_unregister_group:
>> -    vfio_unregister_notifier(vdev, VFIO_GROUP_NOTIFY,
>> -                 &matrix_mdev->group_notifier);
>> +err_kvm:
>> +    vfio_ap_mdev_unset_kvm(matrix_mdev);
>>       return ret;
>>   }

