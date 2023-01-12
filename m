Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C2668634
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Jan 2023 22:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872DF10E92E;
	Thu, 12 Jan 2023 21:51:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF7E10E92C;
 Thu, 12 Jan 2023 21:51:47 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CLNM77010407; Thu, 12 Jan 2023 21:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yseCAGFHWJF/XEKirxsDHH2GXFOhfmVKoHpWCCrZDcw=;
 b=lhZiDG0UrKu+Tn5HA1DuidGAjbmXZJWhEtputbAha3NHQlbUuVBXq2HEHG4sKShcLSuL
 7fK2lXfUqPYE2T4hGpDooAht7PNXKh5+w5aXAqDAuzMandjaH4MnxHwAHjGVfrOsRT2P
 7yKkciwy9ry7Yd9IaNZW4BNOckc04BeykOqaSUFvJP6Dndd/ViiwTJ7xk7mjjWbCMgjT
 QWSJwo2aUicgpc4mjugiER9bcwkTc8P473z7hHIEAPlDL8WtOzHSFc73Z6Ask2FNViIo
 Zxkslx7RXSd9p6DpgxI4hiK9x23Bqj2DVCn1S0+20VRpoFPTZXVLLHvW8szSYTN2y9dI ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2t308jn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 21:51:42 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30CLZxsK016080;
 Thu, 12 Jan 2023 21:51:42 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2t308jn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 21:51:42 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30CKebok018943;
 Thu, 12 Jan 2023 21:51:41 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3n1knv3rjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 21:51:41 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30CLpd7156426976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Jan 2023 21:51:39 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A92935804E;
 Thu, 12 Jan 2023 21:51:39 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E58D58055;
 Thu, 12 Jan 2023 21:51:37 +0000 (GMT)
Received: from [9.160.94.233] (unknown [9.160.94.233])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 12 Jan 2023 21:51:37 +0000 (GMT)
Message-ID: <bce7912a-f904-b5a3-d234-c3e2c42d9e54@linux.ibm.com>
Date: Thu, 12 Jan 2023 16:51:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] vfio: fix potential deadlock on vfio group lock
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
References: <20230112203844.41179-1-mjrosato@linux.ibm.com>
 <20230112140517.6db5b346.alex.williamson@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20230112140517.6db5b346.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gzwbKjnFP3psyl5oYC90NE-LbRy9Vf9K
X-Proofpoint-ORIG-GUID: 74Thb5xo_o4wAWVs6kBZAp8L9VN9h2G8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_12,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120153
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
 david@redhat.com, seanjc@google.com, intel-gfx@lists.freedesktop.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 pasic@linux.ibm.com, jgg@nvidia.com, kvm@vger.kernel.org, pbonzini@redhat.com,
 linux-s390@vger.kernel.org, borntraeger@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 1/12/23 4:05 PM, Alex Williamson wrote:
> On Thu, 12 Jan 2023 15:38:44 -0500
> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> 
>> Currently it is possible that the final put of a KVM reference comes from
>> vfio during its device close operation.  This occurs while the vfio group
>> lock is held; however, if the vfio device is still in the kvm device list,
>> then the following call chain could result in a deadlock:
>>
>> kvm_put_kvm
>>  -> kvm_destroy_vm
>>   -> kvm_destroy_devices
>>    -> kvm_vfio_destroy
>>     -> kvm_vfio_file_set_kvm
>>      -> vfio_file_set_kvm
>>       -> group->group_lock/group_rwsem  
>>
>> Avoid this scenario by having vfio core code acquire a KVM reference
>> the first time a device is opened and hold that reference until the
>> device fd is closed, at a point after the group lock has been released.
>>
>> Fixes: 421cfe6596f6 ("vfio: remove VFIO_GROUP_NOTIFY_SET_KVM")
>> Reported-by: Alex Williamson <alex.williamson@redhat.com>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>> Changes from v1:
>> * Re-write using symbol get logic to get kvm ref during first device
>>   open, release the ref during device fd close after group lock is
>>   released
>> * Drop kvm get/put changes to drivers; now that vfio core holds a
>>   kvm ref until sometime after the device_close op is called, it
>>   should be fine for drivers to get and put their own references to it.
>> ---
>>  drivers/vfio/group.c     |  6 ++---
>>  drivers/vfio/vfio_main.c | 48 +++++++++++++++++++++++++++++++++++++---
>>  include/linux/vfio.h     |  1 -
>>  3 files changed, 48 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
>> index bb24b2f0271e..2b0da82f82f4 100644
>> --- a/drivers/vfio/group.c
>> +++ b/drivers/vfio/group.c
>> @@ -165,9 +165,9 @@ static int vfio_device_group_open(struct vfio_device *device)
>>  	}
>>  
>>  	/*
>> -	 * Here we pass the KVM pointer with the group under the lock.  If the
>> -	 * device driver will use it, it must obtain a reference and release it
>> -	 * during close_device.
>> +	 * Here we pass the KVM pointer with the group under the lock.  A
>> +	 * reference will be obtained the first time the device is opened and
>> +	 * will be held until the device fd is closed.
>>  	 */
>>  	ret = vfio_device_open(device, device->group->iommufd,
>>  			       device->group->kvm);
>> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
>> index 5177bb061b17..c969e2a0ecd3 100644
>> --- a/drivers/vfio/vfio_main.c
>> +++ b/drivers/vfio/vfio_main.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/fs.h>
>>  #include <linux/idr.h>
>>  #include <linux/iommu.h>
>> +#include <linux/kvm_host.h>
>>  #include <linux/list.h>
>>  #include <linux/miscdevice.h>
>>  #include <linux/module.h>
>> @@ -344,6 +345,35 @@ static bool vfio_assert_device_open(struct vfio_device *device)
>>  	return !WARN_ON_ONCE(!READ_ONCE(device->open_count));
>>  }
>>  
>> +static bool vfio_kvm_get_kvm_safe(struct kvm *kvm)
>> +{
>> +	bool (*fn)(struct kvm *kvm);
>> +	bool ret;
>> +
>> +	fn = symbol_get(kvm_get_kvm_safe);
>> +	if (WARN_ON(!fn))
>> +		return false;
>> +
>> +	ret = fn(kvm);
>> +
>> +	symbol_put(kvm_get_kvm_safe);
>> +
>> +	return ret;
>> +}
>> +
>> +static void vfio_kvm_put_kvm(struct kvm *kvm)
>> +{
>> +	void (*fn)(struct kvm *kvm);
>> +
>> +	fn = symbol_get(kvm_put_kvm);
>> +	if (WARN_ON(!fn))
>> +		return;
>> +
>> +	fn(kvm);
>> +
>> +	symbol_put(kvm_put_kvm);
>> +}
>> +
>>  static int vfio_device_first_open(struct vfio_device *device,
>>  				  struct iommufd_ctx *iommufd, struct kvm *kvm)
>>  {
>> @@ -361,16 +391,24 @@ static int vfio_device_first_open(struct vfio_device *device,
>>  	if (ret)
>>  		goto err_module_put;
>>  
>> +	if (kvm && !vfio_kvm_get_kvm_safe(kvm)) {
>> +		ret = -ENOENT;
>> +		goto err_unuse_iommu;
>> +	}
>>  	device->kvm = kvm;
> 
> This could just as easily be:
> 
> 	if (kvm && vfio_kvm_get_kvm_safe(kvm))
> 		device->kvm = kvm;
> 
> Right?  The error path would test device->kvm and we already use
> device->kvm in the release path.

Yeah, with a slight change (see below)

> 
> Otherwise, in the off chance userspace hits this error, what's the
> value in generating a failure here for a device that may or may not
> have a kvm dependency.  A driver with a dependency should fail if
> device->kvm is NULL.

Hmm, you have a point.  Yes, I agree that any driver that needs device->kvm is responsible for checking it for NULL.  I guess I was viewing this case as 'oh, we must already be on the kvm_destroy_vm path for this group' but that just means group->kvm is about to go NULL and doesn't necessarily mean that the vfio group is also going away.

Will change.

> 
>>  	if (device->ops->open_device) {
>>  		ret = device->ops->open_device(device);
>>  		if (ret)
>> -			goto err_unuse_iommu;
>> +			goto err_put_kvm;
>>  	}
>>  	return 0;
>>  
>> +err_put_kvm:
>> +	if (kvm) {

s/kvm/device->kvm/ here to go along with your suggestion above, that way we only do the kvm_put if we previously had a successful kvm_get

>> +		vfio_kvm_put_kvm(kvm);
>> +		device->kvm = NULL;
>> +	}
>>  err_unuse_iommu:
>> -	device->kvm = NULL;
>>  	if (iommufd)
>>  		vfio_iommufd_unbind(device);
>>  	else
>> @@ -387,7 +425,6 @@ static void vfio_device_last_close(struct vfio_device *device,
>>  
>>  	if (device->ops->close_device)
>>  		device->ops->close_device(device);
>> -	device->kvm = NULL;
>>  	if (iommufd)
>>  		vfio_iommufd_unbind(device);
>>  	else
>> @@ -465,6 +502,11 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
>>  
>>  	vfio_device_group_close(device);
>>  
>> +	if (device->open_count == 0 && device->kvm) {
>> +		vfio_kvm_put_kvm(device->kvm);
>> +		device->kvm = NULL;
>> +	}
> 
> IIUC, device->open_count is protected by device->dev_set->lock.  Thanks,

Yep, thanks.  I will surround this bit of code with

mutex_lock(&device->dev_set->lock);
..
mutex_unlock(&device->dev_set->lock);

