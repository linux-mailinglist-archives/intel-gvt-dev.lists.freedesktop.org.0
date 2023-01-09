Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A140166316D
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Jan 2023 21:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E61D10E502;
	Mon,  9 Jan 2023 20:24:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66A110E4FF;
 Mon,  9 Jan 2023 20:24:42 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309KKlM1016333; Mon, 9 Jan 2023 20:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3Wys6/7x7wd0wfoD97SdgqCEz7zVQFAZveBhNxlPSss=;
 b=tJ4rIZ8tROuzX+vWJkb608GiHhYUTMFCwOommXEZh/tsY2i1O16lgcA/uZJdzMhG2Edd
 +rR9C7Cqe4VyBOLlgOLTqcXXbxllC0FZq6oeIHT0pawchWWLyOS5uqmjzArgnAZPgbSX
 XYB/82gU1w67QpSB2AnCOxXFZI8Vhvlc3tGdSq2xZEY0oNbsVIYwacnalA3rxMiG1Doq
 jMB06zW0OXtnhIFLordIH+jmFoc0W0vvj8fzN3xB8my/Bhgw2MSRtladUmODoP2kXhUq
 E7xrZloNf98IRCBFGPKYciVng9PnKB1mRMTC1agYBpgf7xEtcjS7fLjTHbx1Vur6u7DO pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myj6jrums-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 20:24:41 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309JCtET001527;
 Mon, 9 Jan 2023 20:24:41 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myj6jrumb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 20:24:41 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309J860t029748;
 Mon, 9 Jan 2023 20:24:40 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3my0c7h70a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 20:24:40 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309KOc5326804488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 20:24:38 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8590958053;
 Mon,  9 Jan 2023 20:24:38 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52C595805D;
 Mon,  9 Jan 2023 20:24:36 +0000 (GMT)
Received: from [9.65.251.44] (unknown [9.65.251.44])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 20:24:36 +0000 (GMT)
Message-ID: <933407a1-7743-095f-0b60-247d5078519f@linux.ibm.com>
Date: Mon, 9 Jan 2023 15:24:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] KVM: async kvm_destroy_vm for vfio devices
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20230109201037.33051-1-mjrosato@linux.ibm.com>
 <20230109201037.33051-2-mjrosato@linux.ibm.com> <Y7x1Z64g4H0kWOo/@nvidia.com>
Content-Language: en-US
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <Y7x1Z64g4H0kWOo/@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Lykj3PQaIVhtPe3lJ5LUF_4T3ZigKweU
X-Proofpoint-GUID: F5kaSxA9HjfHpK5gN7LUZdxbLYen-_oS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_13,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 pasic@linux.ibm.com, alex.williamson@redhat.com, kvm@vger.kernel.org,
 pbonzini@redhat.com, borntraeger@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 1/9/23 3:13 PM, Jason Gunthorpe wrote:
> On Mon, Jan 09, 2023 at 03:10:36PM -0500, Matthew Rosato wrote:
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
>> Avoid this scenario by adding kvm_put_kvm_async which will perform the
>> kvm_destroy_vm asynchronously if the refcount reaches 0.
>>
>> Fixes: 421cfe6596f6 ("vfio: remove VFIO_GROUP_NOTIFY_SET_KVM")
>> Reported-by: Alex Williamson <alex.williamson@redhat.com>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>>  drivers/gpu/drm/i915/gvt/kvmgt.c  |  6 +++++-
>>  drivers/s390/crypto/vfio_ap_ops.c |  7 ++++++-
>>  include/linux/kvm_host.h          |  3 +++
>>  virt/kvm/kvm_main.c               | 22 ++++++++++++++++++++++
>>  4 files changed, 36 insertions(+), 2 deletions(-)
> 
> Why two patches?
> 
> It looks OK to me

Mentioned in the cover, the fixes: tag is different on the 2nd patch as the s390 PCI passthrough kvm_puts were added later soemtime after 421cfe6596f6 ("vfio: remove VFIO_GROUP_NOTIFY_SET_KVM").  The blamed commit for those changes also landed in a different release (6.0 vs 5.19).

But, now that you mention it, neither is an LTS so it probably doesn't matter all that much and could be squashed if preferred. 

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks!

> 
> Jason

