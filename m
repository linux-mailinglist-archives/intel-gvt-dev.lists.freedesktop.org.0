Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E3766A3DD
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Jan 2023 21:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD3010EAFA;
	Fri, 13 Jan 2023 20:09:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0ED10EAD0;
 Fri, 13 Jan 2023 20:09:11 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DJETN9028868; Fri, 13 Jan 2023 20:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5xGgPO/DQXyp6NO1eNW6XYFpT2xDoaEFxLkLz30opnc=;
 b=q9J4KqyCPKpN9dILgQctn7FdBIgWpTcv6ZCVqNscyhXCMISurvZy3A0ZqkMc+oNgQE29
 5gDNoQTRpb8vyV0eIbWCULJixj0KBPfJuTMm0dH2mbt7o67SkeB17sPH/PPT6LAGH/PS
 d8J9XJfXinsKAyg3hIU2yHJk4NCt4xGI/LCNU6GNL4WpQhbV4/FjeqV3I3YsnMZX4b3C
 zfoyG4oL8xqkOF1RyJtVO7LT7H6HGBFWRgfaHZ5WC2Ryy2Q01uWASSZ3drUjMTDSnO4R
 qgEZbor4Ilkmpkb3S0H+i0Cr9LpTIpSGuelENTVjtp9ElLK0jc2hZFBti9dVuucw0hXt 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n3d9c90ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 20:09:07 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30DJifkg020349;
 Fri, 13 Jan 2023 20:09:07 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n3d9c90a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 20:09:07 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30DJMvfC013176;
 Fri, 13 Jan 2023 20:09:06 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3n1k941r9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 20:09:06 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30DK947a2753036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Jan 2023 20:09:04 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C228B58060;
 Fri, 13 Jan 2023 20:09:04 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66AC35805A;
 Fri, 13 Jan 2023 20:09:02 +0000 (GMT)
Received: from [9.160.94.233] (unknown [9.160.94.233])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 13 Jan 2023 20:09:02 +0000 (GMT)
Message-ID: <e7ddd054-72dc-81c0-609a-59e98e2f835c@linux.ibm.com>
Date: Fri, 13 Jan 2023 15:09:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] vfio: fix potential deadlock on vfio group lock
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20230113171132.86057-1-mjrosato@linux.ibm.com>
 <Y8GoiCBQNiAuVcNw@nvidia.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <Y8GoiCBQNiAuVcNw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FKkc_v4Lu3Dz1BDyFdUKcG-g6uPBeO54
X-Proofpoint-GUID: 1aIDvMavySf7-jfAduYIs_mRsxlS96Zn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130137
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
 pasic@linux.ibm.com, alex.williamson@redhat.com, kvm@vger.kernel.org,
 pbonzini@redhat.com, linux-s390@vger.kernel.org, borntraeger@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 1/13/23 1:52 PM, Jason Gunthorpe wrote:
> On Fri, Jan 13, 2023 at 12:11:32PM -0500, Matthew Rosato wrote:
>> @@ -462,9 +520,19 @@ static inline void vfio_device_pm_runtime_put(struct vfio_device *device)
>>  static int vfio_device_fops_release(struct inode *inode, struct file *filep)
>>  {
>>  	struct vfio_device *device = filep->private_data;
>> +	struct kvm *kvm = NULL;
>>  
>>  	vfio_device_group_close(device);
>>  
>> +	mutex_lock(&device->dev_set->lock);
>> +	if (device->open_count == 0 && device->kvm) {
>> +		kvm = device->kvm;
>> +		device->kvm = NULL;
>> +	}
>> +	mutex_unlock(&device->dev_set->lock);
> 
> This still doesn't seem right, another thread could have incr'd the
> open_count already 
> 
> This has to be done at the moment open_count is decremented to zero,
> while still under the original lock.

Hmm..  Fair.  Well, we can go back to clearing of device->kvm in vfio_device_last_close but the group lock is held then so we can't immediately do the kvm_put at that time -- unless we go back to the notion of stacking the kvm_put on a workqueue, but now from vfio.  If we do that, I think we also have to scrap the idea of putting the kvm_put_kvm function pointer into device->put_kvm too (or otherwise stash it along with the kvm value to be picked up by the scheduled work).

Another thought would be passing the device->open_count that was read while holding the dev_set->lock back on vfio_close_device() / vfio_device_group_close() as an indicator of whether vfio_device_last_close() was called - then you could use the stashed kvm value because it doesn't matter what's currently in device->kvm or what the current device->open_count is, you know that kvm reference needs to be put.

e.g.:
struct *kvm = device->kvm;
void (*put)(struct kvm *kvm) = device->put_kvm;
opened = vfio_device_group_close(device);
if (opened == 0 && kvm)
	put(kvm);

