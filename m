Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04209686899
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  1 Feb 2023 15:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5BA10E3FE;
	Wed,  1 Feb 2023 14:43:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5414189FEA;
 Wed,  1 Feb 2023 14:42:59 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311EgoUn027702; Wed, 1 Feb 2023 14:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uRmV9H0IlKkoZw9pYEG5xkBsyGSu+nnUgHhSpuqI//4=;
 b=Jz5QG43urG3CzJMuNJWlJlMMDmofbZMKOAc6siINhvBfcQ9WnpPdjaSDzypLJRffOJdq
 vcKJahRe08FggT6+w1rqFBSedmaQ7epbBV7V9kA1dO89bSoDZhvhXaqbcKZuGsW6/D3U
 f6LxqOmzBC64L9shez2u3kUTyuWZhccC7bpYYYOkbRP3+VDkSILOB4aftneBgp7gjsy0
 cs4VdTSXUz/VMINomPR98eqjeg+6D25a9UYv2Uvm6KVT9//wOKKv67nLWBYQjWLwYuaX
 jSzuYcPpTPHLFie8d1eXkRfPRJJsHz/ZQushWbSu+GeE39WUJqSCWz4X5bKsBgh5+zpM BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfsp60kyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:42:55 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311Egsq2028141;
 Wed, 1 Feb 2023 14:42:54 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfsp60ky3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:42:54 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311DY22M007780;
 Wed, 1 Feb 2023 14:42:54 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3ncvtex7tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:42:53 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311Egq9265863984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 14:42:52 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 475A758045;
 Wed,  1 Feb 2023 14:42:52 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C19CF58050;
 Wed,  1 Feb 2023 14:42:49 +0000 (GMT)
Received: from [9.65.253.123] (unknown [9.65.253.123])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 14:42:49 +0000 (GMT)
Message-ID: <3b52ffdb-c18c-f3d4-559d-9838419e2bc7@linux.ibm.com>
Date: Wed, 1 Feb 2023 09:42:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] vfio: fix deadlock between group lock and kvm lock
Content-Language: en-US
To: "Liu, Yi L" <yi.l.liu@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20230131200635.44227-1-mjrosato@linux.ibm.com>
 <Y9l5OmCRGYZM2nPy@nvidia.com>
 <DS0PR11MB7529D62614A5DFC56920EE96C3D19@DS0PR11MB7529.namprd11.prod.outlook.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <DS0PR11MB7529D62614A5DFC56920EE96C3D19@DS0PR11MB7529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rhb6pu5ZmBvC2a_9wXw7DPV0FRJCly6d
X-Proofpoint-ORIG-GUID: NZfy7QwErcrBf-5ZqhPHGIzECnA7emIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010125
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
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
 "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
 "david@redhat.com" <david@redhat.com>, "Christopherson, ,
 Sean" <seanjc@google.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2/1/23 7:43 AM, Liu, Yi L wrote:
>> From: Jason Gunthorpe <jgg@nvidia.com>
>> Sent: Wednesday, February 1, 2023 4:26 AM
>>
>> On Tue, Jan 31, 2023 at 03:06:35PM -0500, Matthew Rosato wrote:
>>> @@ -799,13 +794,14 @@
>> EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
>>>  void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
>>>  {
>>>  	struct vfio_group *group = file->private_data;
>>> +	unsigned long flags;
>>>
>>>  	if (!vfio_file_is_group(file))
>>>  		return;
>>>
>>> -	mutex_lock(&group->group_lock);
>>> +	spin_lock_irqsave(&group->kvm_ref_lock, flags);
>>>  	group->kvm = kvm;
>>> -	mutex_unlock(&group->group_lock);
>>> +	spin_unlock_irqrestore(&group->kvm_ref_lock, flags);
>>
>> We know we are in a sleeping context here so these are just
>> 'spin_lock()', same with the other one
> 
> a dumb question. Why spinlock is required here? 😊
> 

You mean as opposed to another mutex?  I don't think it's required per se (we are replacing a mutex so we could have again used another mutex here), but all current users of this new lock hold it over a very short window (e.g. set a pointer as above, or refcount++ and copy the pointer as in the first device_open)

